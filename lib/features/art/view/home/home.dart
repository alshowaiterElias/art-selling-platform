import 'package:art_selling_platform/common/cards/reservationCardsVertical.dart';
import 'package:art_selling_platform/common/custom_shapes/Containers/primaryHeaderContainer.dart';
import 'package:art_selling_platform/common/custom_shapes/Containers/searchBoxContainer.dart';
import 'package:art_selling_platform/common/layout/gridLayout.dart';
import 'package:art_selling_platform/common/texts/sectionHeader.dart';
import 'package:art_selling_platform/features/art/view/home/widgets/homeAppbar.dart';
import 'package:art_selling_platform/features/art/view/home/widgets/homeHorizantalScrollSection.dart';
import 'package:art_selling_platform/features/art/view/home/widgets/homeSlider.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //HEADER
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //AppBar
                  const THomeAppbar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  //SearchBox
                  // const TSearchContainer(
                  //   text: "بحث",
                  //   icon: Iconsax.search_normal,
                  // ),
                  // const SizedBox(
                  //   height: TSizes.spaceBtwSections,
                  // ),
                  //Scrolling Section
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // Title
                        TSectionHeader(
                            title: "الاصناف",
                            textColor: TColors.white,
                            showActionButton: false,
                            onPressd: () {}),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                        // Image-Text
                        const THorizantalListSection()
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections)
                ],
              ),
            ),
            //BODY
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSlider(),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeader(
                    title: "الاكثر شهرة",
                    onPressd: () {
                      // Get.to(() => AllProductsScreen(
                      //       title: "Popular Products",
                      //       futureMethod: controller.fetchAllFeaturedProduct(),
                      //     ));
                    },
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  //Grid

                  // if (controller.isLoading.value) {
                  //   return const TVerticalProductShimmer();
                  // }
                  // if (controller.featuredProducts.isEmpty) {
                  //   return Center(
                  //     child: Text(
                  //       "No Data found",
                  //       style: Theme.of(context).textTheme.bodyMedium,
                  //     ),
                  //   );
                  // }
                  TGridLayout(
                      itemCount: 5, //controller.featuredProducts.length,
                      itemBuilder: (_, index) {
                        return TReservationsVertical(
                            // product: controller.featuredProducts[index],
                            );
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
