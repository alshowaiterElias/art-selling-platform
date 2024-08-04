import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/common/custom_shapes/Containers/artest_details.dart';
import 'package:art_selling_platform/common/custom_shapes/Containers/searchBoxContainer.dart';
import 'package:art_selling_platform/common/shimmer/horizantal_shimmer_effect.dart';
import 'package:art_selling_platform/features/art/controllers/artest_controller.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommissionScreen extends StatelessWidget {
  const CommissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ArtestController.instance;
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          "طلب خاص",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSearchContainer(
                  text: "بحث بالاسم",
                  showBorder: true,
                  showBackground: false,
                  padding: EdgeInsets.zero),
              const SizedBox(height: TSizes.spaceBtwItems),
              Obx(() {
                if (controller.isLoading.value) {
                  return const THorizantalShimmerEffect();
                }
                if (controller.featuredArtests.isEmpty) {
                  return Center(
                    child: Text(
                      "لا يوجد اي فنانون حاليا",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.white),
                    ),
                  );
                }
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return TArtestDetails(
                          showChat: true,
                          artest: controller.featuredArtests[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: TSizes.spaceBtwItems);
                    },
                    itemCount: controller.featuredArtests.length);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
