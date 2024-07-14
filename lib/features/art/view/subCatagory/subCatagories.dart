import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/common/cards/card_horiztontal.dart';
import 'package:art_selling_platform/common/images/roundedImages.dart';
import 'package:art_selling_platform/common/texts/sectionHeader.dart';
import 'package:art_selling_platform/features/art/view/allProducts/allProducts.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SubCatagoriesScreen extends StatelessWidget {
  const SubCatagoriesScreen({
    super.key,
    // required this.catagory,
  });

  // final CatagoryModel catagory;

  @override
  Widget build(BuildContext context) {
    // final controller = CatagoryController.instance;
    return Scaffold(
      appBar: TAppbar(
        title: Text("فن تشكيلي"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TRoundedImage(
                  imgUrl: TImageStrings.lightLogo,
                  width: double.infinity,
                  applyImageRaduis: true),
              const SizedBox(height: TSizes.spaceBtwSections),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      TSectionHeader(
                        title: "رسم بالفحم",
                        showActionButton: true,
                        onPressd: () => Get.to(() => AllProductsScreen(
                              title: "رسم بالفحم",
                            )),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      SizedBox(
                        height: 120,
                        child: ListView.separated(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return TCardHorizontal();
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: TSizes.spaceBtwItems)),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
