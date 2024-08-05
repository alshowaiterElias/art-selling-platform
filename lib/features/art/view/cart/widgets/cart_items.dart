import 'package:art_selling_platform/common/cart/add_remove_counter.dart';
import 'package:art_selling_platform/common/cart/cart_Item.dart';
import 'package:art_selling_platform/common/texts/price_text.dart';
import 'package:art_selling_platform/features/art/controllers/cart_controller.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddReomveBtn = true});

  final bool showAddReomveBtn;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(() => ListView.separated(
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.cartItems.length,
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
        itemBuilder: (_, index) {
          final item = controller.cartItems[index];

          return Column(
            children: [
              TCartItem(
                cartItem: item,
              ),
              if (showAddReomveBtn)
                const SizedBox(height: TSizes.spaceBtwItems),
              if (showAddReomveBtn)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 70),
                        TAddRemoveCounter(
                          remove: () => controller.removeOneFromCart(item),
                        ),
                      ],
                    ),
                    TPriceText(
                      price: item.price.toString(),
                      currencySign: " ريال",
                    )
                  ],
                ),
            ],
          );
        }));
  }
}
