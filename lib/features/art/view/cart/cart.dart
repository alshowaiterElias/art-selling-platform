import 'package:art_selling_platform/common/animations/loader_animation.dart';
import 'package:art_selling_platform/common/appbar/app_bar.dart';
import 'package:art_selling_platform/features/art/controllers/cart_controller.dart';
import 'package:art_selling_platform/features/art/view/cart/widgets/cart_items.dart';
import 'package:art_selling_platform/features/art/view/checkout/checkout.dart';
import 'package:art_selling_platform/nav.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          "سلة المشتريات",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Obx(() {
        final emptyWidget = TAnimationLoaderWidget(
          text: "لا توجد عناصر",
          animation: TImageStrings.onBoaringImage1,
          showAction: true,
          actionText: "انتقل الى قائمة المنتجات",
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );
        return controller.cartItems.isEmpty
            ? emptyWidget
            : const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: CartItems(),
                ),
              );
      }),
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const CheckOutScreen());
                  },
                  child: Obx(
                    () => Text(
                        "حسابك ${controller.totalCartPrice.value.toString()} ريال"),
                  )),
            ),
    );
  }
}
