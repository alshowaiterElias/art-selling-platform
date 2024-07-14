import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/common/sortableProducts.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({
    super.key,
    required this.title,
    // this.query,
    // this.futureMethod,
  });

  final String title;
  // final Query? query;
  // final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: TAppbar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: TSortableProducts()),
      ),
    );
  }
}
