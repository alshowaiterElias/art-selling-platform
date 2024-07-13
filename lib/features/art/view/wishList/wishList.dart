import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/common/cards/card_vertical.dart';
import 'package:art_selling_platform/common/icons/TCircularIcon.dart';
import 'package:art_selling_platform/common/layout/gridLayout.dart';
import 'package:art_selling_platform/nav.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          "المفضلة",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            backgroundColor: Colors.transparent,
            color: THelperFunctions.isDarkMode(context)
                ? TColors.white
                : TColors.dark,
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: TGridLayout(
              itemCount: 3,
              itemBuilder: (_, index) {
                return const TCardVertical();
              },
            )),
      ),
    );
  }
}
