import 'package:art_selling_platform/common/custom_shapes/Containers/circular_container.dart';
import 'package:art_selling_platform/common/icons/favoirate_icon.dart';
import 'package:art_selling_platform/common/images/rounded_images.dart';
import 'package:art_selling_platform/common/texts/art_title_2.dart';
import 'package:art_selling_platform/common/texts/art_title_with_icon.dart';
import 'package:art_selling_platform/common/texts/price_text.dart';
import 'package:art_selling_platform/features/art/controllers/product_controller.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/enums.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class TCardHorizontal extends StatelessWidget {
  const TCardHorizontal({
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
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.iconsLg),
          color: isDark ? TColors.darkerGrey : TColors.lightContainer),
      child: Row(
        children: [
          //thumbnail
          TCircularContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: isDark ? TColors.dark : TColors.white,
            child: Stack(
              children: [
                //thumbnail Image
                SizedBox(
                  width: 120,
                  height: 120,
                  child: TRoundedImage(
                    imgUrl: product.thumbNail,
                    applyImageRaduis: true,
                    isNetworkImage: true,
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwItems / 2),
                //sale Tag
                if (salePrecentage != null)
                  Positioned(
                    top: 0,
                    child: TCircularContainer(
                      raduis: TSizes.sm,
                      backgroundColor: TColors.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text("$salePrecentage %",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: TColors.balck)),
                    ),
                  ),
                Positioned(
                    right: 0,
                    top: -10,
                    child: TFavoriateIcon(
                      productId: product.id,
                    ))
              ],
            ),
          )
          //Details
          ,
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(left: TSizes.sm, top: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TArtTitleText(
                        title: product.title,
                        textSizes: TextSizes.small,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      TArtTitleWithIcon(title: product.artest!.name),
                    ],
                  ),
                  const Spacer(),
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
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
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
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRaduisMd),
                              bottomRight:
                                  Radius.circular(TSizes.cardRaduisMd)),
                        ),
                        child: const SizedBox(
                          width: TSizes.iconsLg * 1.2,
                          height: TSizes.iconsLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: TColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
