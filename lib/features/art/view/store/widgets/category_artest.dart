import 'package:art_selling_platform/common/card_showcase.dart';
import 'package:art_selling_platform/common/shimmer/boxed_shimmer.dart';
import 'package:art_selling_platform/common/shimmer/list_shimmer.dart';
import 'package:art_selling_platform/features/art/controllers/artest_controller.dart';
import 'package:art_selling_platform/features/art/models/catagory_model.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';

class CatagoryArtests extends StatelessWidget {
  const CatagoryArtests({super.key, required this.catagory});

  final CategoryModel catagory;

  @override
  Widget build(BuildContext context) {
    final controller = ArtestController.instance;
    return FutureBuilder(
        future: controller.getArtestsForCatagory(catagory.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              TListTileShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
              TBoxedShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
            ],
          );

          final widget = TCloudHelperFunction.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          final artests = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: artests.length,
            itemBuilder: (context, index) {
              final artest = artests[index];
              return FutureBuilder(
                  future: controller.getArtestProducts(
                      artestId: artest.id, limit: 3),
                  builder: (context, snapshot) {
                    final widget = TCloudHelperFunction.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final products = snapshot.data!;

                    return TCardShowCase(
                      artest: artest,
                      images: products.map((e) => e.thumbNail).toList(),
                    );
                  });
            },
          );
        });
  }
}
