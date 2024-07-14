import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/common/custom_shapes/Containers/artest_details.dart';
import 'package:art_selling_platform/common/layout/gridLayout.dart';
import 'package:art_selling_platform/common/texts/sectionHeader.dart';
import 'package:art_selling_platform/features/art/view/art_Details/art_details.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = BrandController.instance;
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
              // const TSectionHeader(title: "Brands"),
              const SizedBox(height: TSizes.spaceBtwItems),
              //Brands

              TGridLayout(
                  mainAxiesExtent: 80,
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return TArtestDetails();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
