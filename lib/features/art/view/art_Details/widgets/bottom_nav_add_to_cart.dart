import 'package:art_selling_platform/features/art/controllers/cart_controller.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:flutter/material.dart';

import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';

class TBottomAddtoCart extends StatelessWidget {
  const TBottomAddtoCart({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
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
          ElevatedButton(
            onPressed: () {
              if (controller.productQuantityInCart.value == 0) {
                controller.addToCart(product);
              } else {
                TLoaders.warningSnackBar(
                    title: "لا تحتاج الى اضافة",
                    message: "المنتج مضاف مسبقا في قائمة المشتريات");
              }
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
