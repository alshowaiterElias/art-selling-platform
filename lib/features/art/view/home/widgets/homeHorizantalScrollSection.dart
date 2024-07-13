import 'package:art_selling_platform/common/image_text/verticalImageWithText.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class THorizantalListSection extends StatelessWidget {
  const THorizantalListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(CatagoryController());

    // if (controller.isLoading.value == true) return const TCatagoryShimmer();
    // if (controller.featuredCatagories.isEmpty) {
    //   return Center(
    //     child: Text(
    //       "No Data Found",
    //       style: Theme.of(context)
    //           .textTheme
    //           .bodyMedium!
    //           .apply(color: Colors.white),
    //     ),
    //   );
    // }
    return SizedBox(
      height: 90,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6, // controller.featuredCatagories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageWithText(
            backgroundColor: TColors.white,
            isNetworkImage: false,
            image: TImageStrings.lightLogo,
            text: "فن تشكيلي",
            textColor: TColors.white,
            onTap: () {
              // Get.to(() => SubCatagoriesScreen(
              //       catagory: controller.featuredCatagories[index],
              //     ));
            },
          );
        },
      ),
    );
  }
}
