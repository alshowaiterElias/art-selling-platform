import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/common/custom_shapes/Containers/artest_details.dart';
import 'package:art_selling_platform/common/sortableProducts.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:art_selling_platform/features/art/view/art_Details/art_details.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({
    super.key,
    // required this.brand,
  });

  // final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    // final controller = BrandController.instance;
    return Scaffold(
      appBar: const TAppbar(
        title: Text("Nike"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ArtDetailsScreen(
                product: ProductModel.empty(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TSortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
