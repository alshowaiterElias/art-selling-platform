import 'package:art_selling_platform/common/cards/card_vertical.dart';
import 'package:art_selling_platform/common/layout/gridLayout.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    // required this.products,
  });
  // final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    // final contoller = Get.put(AllProductController());
    // contoller.assignProducts(products);
    return Column(
      children: [
        //Drop Down Menu
        DropdownButtonFormField(
          value: "Name",
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: [
            "Name",
            "Higher Prices",
            "Lower Prices",
            "Sale",
            "Newest",
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {
            // contoller.sortProducts(value!);
          },
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        //all products
        TGridLayout(
          itemCount: 10,
          itemBuilder: (_, index) {
            return TCardVertical();
          },
        )
      ],
    );
  }
}
