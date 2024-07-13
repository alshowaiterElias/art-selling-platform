import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TCartIcon extends StatelessWidget {
  const TCartIcon({
    super.key,
    this.iconColor = TColors.white,
  });

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(CartController());
    return Stack(children: [
      IconButton(
          onPressed: () {
            // Get.to(() => const CartScreen());
          },
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          )),
      Positioned(
        right: 0,
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18), color: TColors.balck),
          child: Center(
            child: Text(
              // controller.noOfCartItem.value.toString(),
              "1",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .apply(color: TColors.white, fontSizeFactor: 0.8),
            ),
          ),
        ),
      )
    ]);
  }
}
