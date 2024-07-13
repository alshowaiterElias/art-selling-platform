import 'package:art_selling_platform/common/custom_shapes/Containers/circularContainer.dart';
import 'package:art_selling_platform/common/texts/art_title_2.dart';
import 'package:art_selling_platform/common/texts/art_title_with_icon.dart';
import 'package:art_selling_platform/common/texts/priceText.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/enums.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ArtMetaData extends StatelessWidget {
  const ArtMetaData({
    super.key,
    // required this.product,
  });

  // final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // final controller = ProductController.instance;
    // final salePrecentage =
    //     controller.calculateSalePrecentage(product.price, product.salePrice);
    // final bool isDark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //sale
            TCircularContainer(
              raduis: TSizes.sm,
              backgroundColor: TColors.secondaryColor.withOpacity(0.9),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text("23%",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.balck)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            //Price
            // if (product.productType == ProductType.single.toString() &&
            //     product.salePrice > 0)
            Text("10000",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            // if (product.productType == ProductType.single.toString() &&
            //     product.salePrice > 0)
            const SizedBox(width: TSizes.spaceBtwItems),

            TPriceText(
              price: "8000",
              isLarge: true,
              currencySign: " Real",
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //title
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TArtTitleText(title: "الموناليزا", textSizes: TextSizes.medium),
            SizedBox(width: TSizes.spaceBtwItems),
            TArtTitleText(title: ":الاسم"),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        //status
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("متوفر", //controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TArtTitleText(title: ":الحالة"),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TArtTitleWithIcon(
              title: "MSA", // product.brand != null ? product.brand!.name : "",
              textSizes: TextSizes.medium,
            ),
            SizedBox(width: TSizes.spaceBtwItems),
            TArtTitleText(title: ":الفنان"),
          ],
        )
      ],
    );
  }
}
