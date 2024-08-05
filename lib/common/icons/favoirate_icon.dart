import 'package:art_selling_platform/common/icons/t_circular_icon.dart';
import 'package:art_selling_platform/features/art/controllers/favourites_controller.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class TFavoriateIcon extends StatelessWidget {
  const TFavoriateIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () => TCircularIcon(
        icon:
            controller.isFavourites(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourites(productId) ? Colors.red : null,
        width: 32,
        height: 32,
        size: TSizes.iconsSm,
        onPressed: () {
          controller.toggleFavouritesProduct(productId);
        },
      ),
    );
  }
}
