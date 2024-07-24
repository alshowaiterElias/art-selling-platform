import 'package:art_selling_platform/common/cards/card_vertical.dart';
import 'package:art_selling_platform/common/layout/gridLayout.dart';
import 'package:art_selling_platform/common/shimmer/vertical_product_shimmer.dart';
import 'package:art_selling_platform/common/texts/sectionHeader.dart';
import 'package:art_selling_platform/features/art/controllers/catagory_controller.dart';
import 'package:art_selling_platform/features/art/models/catagory_model.dart';
import 'package:art_selling_platform/features/art/view/allProducts/allProducts.dart';
import 'package:art_selling_platform/features/art/view/store/widgets/category_artest.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCatTap extends StatelessWidget {
  const TCatTap({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CatagoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                CatagoryArtests(catagory: category),
                const SizedBox(height: TSizes.spaceBtwItems),
                FutureBuilder(
                    future:
                        controller.getCatagoryProduct(catagoryId: category.id),
                    builder: (context, snapshot) {
                      final widget = TCloudHelperFunction.checkMultiRecordState(
                          snapshot: snapshot,
                          loader: const TVerticalProductShimmer());
                      if (widget != null) return widget;

                      final products = snapshot.data!;
                      return Column(
                        children: [
                          TSectionHeader(
                            title: "قد يعجبك",
                            onPressd: () => Get.to(() => AllProductsScreen(
                                  title: category.name,
                                  futureMethod: controller.getCatagoryProduct(
                                      catagoryId: category.id, limit: -1),
                                )),
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          TGridLayout(
                            itemCount: products.length,
                            itemBuilder: (_, index) => TCardVertical(
                              product: products[index],
                            ),
                          )
                        ],
                      );
                    }),
              ],
            ),
          ),
        ]);
  }
}
