import 'package:art_selling_platform/common/appbar/app_bar.dart';
import 'package:art_selling_platform/common/cards/card_horiztontal.dart';
import 'package:art_selling_platform/common/images/rounded_images.dart';
import 'package:art_selling_platform/common/shimmer/horizantal_shimmer_effect.dart';
import 'package:art_selling_platform/common/texts/section_header.dart';
import 'package:art_selling_platform/features/art/controllers/catagory_controller.dart';
import 'package:art_selling_platform/features/art/models/catagory_model.dart';
import 'package:art_selling_platform/features/art/view/all_products/all_products.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SubCatagoriesScreen extends StatelessWidget {
  const SubCatagoriesScreen({
    super.key,
    required this.catagory,
  });

  final CategoryModel catagory;

  @override
  Widget build(BuildContext context) {
    final controller = CatagoryController.instance;
    return Scaffold(
      appBar: TAppbar(
        title: Text(catagory.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: controller.getSubCatagories(catagory.id),
              builder: (context, snapshot) {
                final widget = TCloudHelperFunction.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: const THorizantalShimmerEffect());

                if (widget != null) return widget;

                final subCategories = snapshot.data!;

                return Column(
                  children: [
                    TRoundedImage(
                        imgUrl: catagory.image,
                        isNetworkImage: true,
                        width: double.infinity,
                        applyImageRaduis: true),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return FutureBuilder(
                            future: controller.getCatagoryProduct(
                                catagoryId: subCategories[index].name),
                            builder: (context, snapshot) {
                              final widget =
                                  TCloudHelperFunction.checkMultiRecordState(
                                      snapshot: snapshot,
                                      loader: const THorizantalShimmerEffect());

                              if (widget != null) return widget;

                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  TSectionHeader(
                                    title: subCategories[index].name,
                                    showActionButton: true,
                                    onPressd: () =>
                                        Get.to(() => AllProductsScreen(
                                              title: subCategories[index].name,
                                              futureMethod:
                                                  controller.getCatagoryProduct(
                                                      catagoryId:
                                                          subCategories[index]
                                                              .id,
                                                      limit: -1),
                                            )),
                                  ),
                                  const SizedBox(
                                      height: TSizes.spaceBtwItems / 2),
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                        itemCount: products.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return TCardHorizontal(
                                              product: products[index]);
                                        },
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                                width: TSizes.spaceBtwItems)),
                                  )
                                ],
                              );
                            });
                      },
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
