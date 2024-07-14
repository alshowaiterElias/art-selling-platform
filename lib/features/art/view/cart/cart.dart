import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/features/art/view/cart/widgets/cartItems.dart';
import 'package:art_selling_platform/features/art/view/checkout/checkout.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = CartController.instance;
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          "سلة المشتريات",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body:
          // final emptyWidget = TAnimationLoaderWidget(
          //   text: "No Itmes",
          //   animation: TImageStrings.onBoaringImage1,
          //   showAction: true,
          //   actionText: "Fill it",
          //   onActionPressed: () => Get.off(() => const NavigationMenu()),
          // );

          const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: CartItems(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {
              Get.to(() => const CheckOutScreen());
            },
            child: Text("حسابك 10000 ريال")),
      ),
    );
  }
}
