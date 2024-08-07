import 'package:art_selling_platform/common/custom_shapes/Containers/circular_container.dart';
import 'package:art_selling_platform/common/styles/t_shadow_style.dart';
import 'package:art_selling_platform/common/texts/art_title.dart';
import 'package:art_selling_platform/common/texts/art_title_with_icon.dart';
import 'package:art_selling_platform/features/art/controllers/cart_controller.dart';
import 'package:art_selling_platform/features/art/controllers/product_controller.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:art_selling_platform/features/art/view/art_Details/art_details.dart';
import 'package:flutter/material.dart';
import 'package:art_selling_platform/common/icons/favoirate_icon.dart';
import 'package:art_selling_platform/common/images/rounded_images.dart';

import 'package:art_selling_platform/common/texts/price_text.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';

import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TCardVertical extends StatelessWidget {
  const TCardVertical({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePrecentage =
        controller.calculateSalePrecentage(product.price, product.salePrice);
    final bool isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(() => ArtDetailsScreen(
              product: product,
            ));
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: isDark ? TColors.darkGrey : TColors.white,
            borderRadius: BorderRadius.circular(TSizes.cardRaduisLg),
            boxShadow: [TShadowStyle.verticalReservationShadow]),
        child: Column(
          children: [
            //Thumbnail
            TCircularContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: isDark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  //Image

                  Center(
                    child: TRoundedImage(
                      imgUrl: product.thumbNail,
                      isNetworkImage: true,
                    ),
                  ),
                  if (salePrecentage != null)
                    Positioned(
                      top: 12,
                      child: TCircularContainer(
                        raduis: TSizes.sm,
                        backgroundColor:
                            TColors.secondaryColor.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text("$salePrecentage %",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.balck)),
                      ),
                    ),
                  Positioned(
                    right: 3,
                    top: 3,
                    child: TFavoriateIcon(productId: product.id),
                  )
                ],
              ),
            ), //Details
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Name and Pitch Type
                  TArtTitle(
                    smallSize: true,
                    title: product.title,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  TArtTitleWithIcon(title: product.artest!.name),
                ],
              ),
            ),
            const Spacer(),
            //price and Icon Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      if (product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm),
                          child: Text(
                            product.salePrice.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: TPriceText(
                          price: product.price.toString(),
                        ),
                      ),
                    ],
                  ),
                ),
                //add to cart
                ProductAddToCartIcon(
                  product: product,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductAddToCartIcon extends StatelessWidget {
  const ProductAddToCartIcon({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return InkWell(onTap: () {
      if (controller.getProductQuantityInCart(product.id) == 0) {
        final cartItme = controller.convertToCartItem(product);
        controller.addOneToCart(cartItme);
      }
    }, child: Obx(() {
      final prodcutQuantityInCart =
          controller.getProductQuantityInCart(product.id);
      return Container(
        decoration: const BoxDecoration(
          color: TColors.primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRaduisMd),
              bottomRight: Radius.circular(TSizes.cardRaduisMd)),
        ),
        child: SizedBox(
          width: TSizes.iconsLg * 1.2,
          height: TSizes.iconsLg * 1.2,
          child: Center(
            child: prodcutQuantityInCart > 0
                ? Text(
                    prodcutQuantityInCart.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: TColors.white),
                  )
                : const Icon(Iconsax.add, color: TColors.white),
          ),
        ),
      );
    }));
  }
}
