import 'package:art_selling_platform/common/cards/card_vertical.dart';
import 'package:art_selling_platform/common/layout/gridLayout.dart';
import 'package:art_selling_platform/features/art/controllers/allProduct_controller.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        //Drop Down Menu
        DropdownButtonFormField(
          value: controller.selectedOption.value,
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: [
            "الاسم",
            "الاغلى سعرا",
            "الارخص سعرا",
            "تخفيض",
            "الاحدث",
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {
            controller.sortProducts(value!);
          },
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        //all products
        Obx(
          () => TGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) {
              return TCardVertical(
                product: controller.products[index],
              );
            },
          ),
        )
      ],
    );
  }
}
