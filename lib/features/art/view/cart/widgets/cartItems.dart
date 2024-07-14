import 'package:art_selling_platform/common/cart/addRemoveCounter.dart';
import 'package:art_selling_platform/common/cart/cartItem.dart';
import 'package:art_selling_platform/common/texts/priceText.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddReomveBtn = true});

  final bool showAddReomveBtn;

  @override
  Widget build(BuildContext context) {
    // final controller = CartController.instance;
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemBuilder: (_, index) {
        // final item = controller.cartItems[index];
        return Column(
          children: [
            TCartItem(),
            if (showAddReomveBtn) const SizedBox(height: TSizes.spaceBtwItems),
            if (showAddReomveBtn)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 70),
                      TAddRemoveCounter(
                        quantity: 10,
                        add: () {}, // => controller.addOneToCart(item),
                        remove: () {}, // => controller.removeOneFromCart(item),
                      ),
                    ],
                  ),
                  TPriceText(
                    price: 10000.toString(),
                    currencySign: " ريال",
                  )
                ],
              ),
          ],
        );
      },
    );
  }
}