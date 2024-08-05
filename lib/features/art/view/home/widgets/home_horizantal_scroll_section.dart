import 'package:art_selling_platform/common/image_text/vertical_image_with_text.dart';
import 'package:art_selling_platform/common/shimmer/catagory_shimmer.dart';
import 'package:art_selling_platform/features/art/controllers/catagory_controller.dart';
import 'package:art_selling_platform/features/art/view/subCatagory/sub_catagories.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THorizantalListSection extends StatelessWidget {
  const THorizantalListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CatagoryController());

    return Obx(() {
      if (controller.isLoading.value == true) return const TCatagoryShimmer();
      if (controller.featuredCatagories.isEmpty) {
        return Center(
          child: Text(
            "لا يوجد هناك اصناف مضافة",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 90,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.featuredCatagories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TVerticalImageWithText(
              backgroundColor: TColors.white,
              isNetworkImage: true,
              image: controller.featuredCatagories[index].image,
              text: controller.featuredCatagories[index].name,
              textColor: TColors.white,
              onTap: () {
                Get.to(() => SubCatagoriesScreen(
                      catagory: controller.featuredCatagories[index],
                    ));
              },
            );
          },
        ),
      );
    });
  }
}
