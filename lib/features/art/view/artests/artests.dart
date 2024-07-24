import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/common/custom_shapes/Containers/artest_details.dart';
import 'package:art_selling_platform/common/layout/gridLayout.dart';
import 'package:art_selling_platform/common/shimmer/artests_shimmer.dart';
import 'package:art_selling_platform/common/texts/sectionHeader.dart';
import 'package:art_selling_platform/features/art/controllers/artest_controller.dart';
import 'package:art_selling_platform/features/art/view/artests/artestProduts.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtestScreen extends StatelessWidget {
  const ArtestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ArtestController.instance;
    return Scaffold(
      appBar: const TAppbar(
        title: Text("الفنانون"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeader(
                title: "الفنانون",
                showActionButton: true,
                buttonTitle: "",
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              //Brands

              Obx(() {
                if (controller.isLoading.value) {
                  return const TArtestsShimmer();
                }
                if (controller.allArtests.isEmpty) {
                  return Center(
                    child: Text(
                      "لا يوجد اي فنانين حاليا",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.white),
                    ),
                  );
                }
                return TGridLayout(
                    mainAxiesExtent: 80,
                    itemCount: controller.featuredArtests.length,
                    itemBuilder: (_, index) {
                      return TArtestDetails(
                        artest: controller.allArtests[index],
                        onTap: () => Get.to(() => ArtestProducts(
                            artest: controller.allArtests[index])),
                      );
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
