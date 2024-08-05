import 'package:art_selling_platform/common/appbar/app_bar.dart';
import 'package:art_selling_platform/common/shimmer/vertical_product_shimmer.dart';
import 'package:art_selling_platform/common/sortable_products.dart';
import 'package:art_selling_platform/features/art/controllers/all_product_controller.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/cloud_helper_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({
    super.key,
    required this.title,
    this.query,
    this.futureMethod,
  });

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: TAppbar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              const loader = TVerticalProductShimmer();
              final widget = TCloudHelperFunction.checkMultiRecordState(
                  snapshot: snapshot, loader: loader);
              if (widget != null) return widget;
              final products = snapshot.data!;
              return Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: TSortableProducts(
                    products: products,
                  ));
            }),
      ),
    );
  }
}
