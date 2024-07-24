import 'package:art_selling_platform/common/cards/card_vertical.dart';
import 'package:art_selling_platform/common/custom_shapes/Containers/primaryHeaderContainer.dart';
import 'package:art_selling_platform/common/layout/gridLayout.dart';
import 'package:art_selling_platform/common/shimmer/vertical_product_shimmer.dart';
import 'package:art_selling_platform/common/texts/sectionHeader.dart';
import 'package:art_selling_platform/features/art/controllers/product_controller.dart';
import 'package:art_selling_platform/features/art/view/allProducts/allProducts.dart';
import 'package:art_selling_platform/features/art/view/home/widgets/homeAppbar.dart';
import 'package:art_selling_platform/features/art/view/home/widgets/homeHorizantalScrollSection.dart';
import 'package:art_selling_platform/features/art/view/home/widgets/homeSlider.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //HEADER
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //AppBar
                  const THomeAppbar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

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
                        ),
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
                      Get.to(() => AllProductsScreen(
                            title: "الاكثر شهرة",
                            query: FirebaseFirestore.instance
                                .collection("Products")
                                .where("IsFeatured", isEqualTo: true)
                                .limit(6),
                            futureMethod: controller.fetchAllFeaturedProduct(),
                          ));
                    },
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  //Grid

                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TVerticalProductShimmer();
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          "لا تتوفر اي منتجات",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return TGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) {
                          return TCardVertical(
                            product: controller.featuredProducts[index],
                          );
                        });
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
