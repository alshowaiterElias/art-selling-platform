import 'package:art_selling_platform/common/appbar/app_bar.dart';
import 'package:art_selling_platform/common/shimmer/vertical_product_shimmer.dart';
import 'package:art_selling_platform/common/sortable_products.dart';
import 'package:art_selling_platform/features/art/controllers/artest_controller.dart';
import 'package:art_selling_platform/features/art/models/artest_model.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';

class ArtestProducts extends StatelessWidget {
  const ArtestProducts({
    super.key,
    required this.artest,
  });

  final ArtestModel artest;

  @override
  Widget build(BuildContext context) {
    final controller = ArtestController.instance;
    return Scaffold(
      appBar: TAppbar(
        title: Text(artest.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const SizedBox(height: TSizes.spaceBtwSections),
              FutureBuilder(
                  future: controller.getArtestProducts(artestId: artest.id),
                  builder: (context, snapshot) {
                    final widget = TCloudHelperFunction.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: const TVerticalProductShimmer());
                    if (widget != null) return widget;

                    final products = snapshot.data!;
                    return TSortableProducts(
                      products: products,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
