import 'package:art_selling_platform/features/art/controllers/cart_controller.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Column(
      children: [
        //subTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(controller.totalCartPrice.value.toString(),
                style: Theme.of(context).textTheme.bodyMedium),
            Text("حسابك", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        // Tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(controller.shippingCost.toString(),
                style: Theme.of(context).textTheme.labelLarge),
            Text("حساب البرنامج",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        // Tax fee
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text("Tax fee", style: Theme.of(context).textTheme.bodyMedium),
        //     Text("100", style: Theme.of(context).textTheme.labelLarge),
        //   ],
        // ),

        const SizedBox(height: TSizes.spaceBtwItems / 2),
        // Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("الحساب الكلي", style: Theme.of(context).textTheme.bodyMedium),
            Text((controller.findTotalPrice().toString()).toString(),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
