import 'package:art_selling_platform/common/appbar/app_bar.dart';
import 'package:art_selling_platform/common/cards/card_vertical.dart';
import 'package:art_selling_platform/common/icons/t_circular_icon.dart';
import 'package:art_selling_platform/common/layout/grid_layout.dart';
import 'package:art_selling_platform/common/shimmer/vertical_product_shimmer.dart';
import 'package:art_selling_platform/features/art/controllers/favourites_controller.dart';
import 'package:art_selling_platform/nav.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/cloud_helper_function.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
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
            child: Obx(
              () => FutureBuilder(
                  future: controller.favouritesProducts(),
                  builder: (context, snapshot) {
                    final widget = TCloudHelperFunction.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: const TVerticalProductShimmer(),
                        nothingFound: const Center(
                          child: Text("لا توجد اي عناصر"),
                        ));
                    if (widget != null) return widget;

                    final products = snapshot.data!;
                    return TGridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) {
                        return TCardVertical(
                          product: products[index],
                        );
                      },
                    );
                  }),
            )),
      ),
    );
  }
}
