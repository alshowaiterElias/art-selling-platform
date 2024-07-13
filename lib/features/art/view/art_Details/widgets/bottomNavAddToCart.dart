import 'package:flutter/material.dart';

import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/icons/TCircularIcon.dart';

class TBottomAddtoCart extends StatelessWidget {
  const TBottomAddtoCart({
    super.key,
    // required this.product,
  });

  // final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // final controller = CartController.instance;
    // controller.updateAlreadyAddedProductCount(product);
    final bool isDark = THelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: isDark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRaduisLg),
          topRight: Radius.circular(TSizes.cardRaduisLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TCircularIcon(
                  onPressed: () {},
                  // => controller.productQuantityInCart.value < 1
                  //     ? null
                  //     : controller.productQuantityInCart.value--,
                  icon: Iconsax.minus,
                  width: 40,
                  height: 40,
                  backgroundColor: TColors.darkGrey,
                  color: TColors.white),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text("0", style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: TSizes.spaceBtwItems),
              TCircularIcon(
                  onPressed:
                      () {}, //=> controller.productQuantityInCart.value++,
                  icon: Iconsax.add,
                  width: 40,
                  height: 40,
                  backgroundColor: TColors.balck,
                  color: TColors.white),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // controller.productQuantityInCart < 1
              //     ? null
              //     : controller.addToCart(product);
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: TColors.balck,
                side: const BorderSide(color: TColors.balck)),
            child: const Text("أضف للمشتروات"),
          )
        ],
      ),
    );
  }
}
