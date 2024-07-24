import 'package:art_selling_platform/common/custom_shapes/Containers/circularContainer.dart';
import 'package:art_selling_platform/common/texts/art_title_2.dart';
import 'package:art_selling_platform/common/texts/art_title_with_icon.dart';
import 'package:art_selling_platform/common/texts/priceText.dart';
import 'package:art_selling_platform/features/art/controllers/product_controller.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/enums.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

class ArtMetaData extends StatelessWidget {
  const ArtMetaData({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //sale
            if (product.salePrice > 0)
              TCircularContainer(
                raduis: TSizes.sm,
                backgroundColor: TColors.secondaryColor.withOpacity(0.9),
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm, vertical: TSizes.xs),
                child: Text('$salePrecentage %',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.balck)),
              ),
            const SizedBox(width: TSizes.spaceBtwItems),

            //Price
            if (product.salePrice > 0)
              Text(product.salePrice.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            if (product.salePrice > 0)
              const SizedBox(width: TSizes.spaceBtwItems),

            TPriceText(
              price: product.price.toString(),
              isLarge: true,
              currencySign: " Real",
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //title
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TArtTitleText(title: product.title, textSizes: TextSizes.medium),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TArtTitleText(title: ":الاسم"),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        //status
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("متوفر", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TArtTitleText(title: ":الحالة"),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TArtTitleWithIcon(
              title: product.artest != null
                  ? product.artest!.name
                  : "", // product.brand != null ? product.brand!.name : "",
              textSizes: TextSizes.medium,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TArtTitleText(title: ":الفنان"),
          ],
        )
      ],
    );
  }
}
