import 'package:art_selling_platform/common/appbar/app_bar.dart';
import 'package:art_selling_platform/common/custom_shapes/Containers/circular_container.dart';
import 'package:art_selling_platform/features/art/controllers/cart_controller.dart';
import 'package:art_selling_platform/features/art/controllers/order_controller.dart';
import 'package:art_selling_platform/features/art/view/cart/widgets/cart_items.dart';
import 'package:art_selling_platform/features/art/view/checkout/widgets/billing_address_section.dart';
import 'package:art_selling_platform/features/art/view/checkout/widgets/billing_amount_section.dart';
import 'package:art_selling_platform/features/art/view/checkout/widgets/billing_payment_section.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    final orderController = Get.put(OrderController());
    final bool isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          "الحساب",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Items in cart
              const CartItems(showAddReomveBtn: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Coupon
              // const TPromoCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              //billing Section
              TCircularContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                backgroundColor: isDark ? TColors.balck : TColors.white,
                child: const Column(
                  children: [
                    //pricing
                    BillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    //divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //payment method
                    BillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    Divider(),

                    //address
                    BillingAddressSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {
              cartController.totalCartPrice.value > 0.0
                  ? orderController
                      .processOrder(cartController.findTotalPrice())
                  : TLoaders.warningSnackBar(
                      title: "قائمة المشرتيات فارغة",
                      message: "اضف مشتريات لتتمكن من تنفيذ عمليات الشراء");
            },
            child: Text(
                " حسابك ${cartController.findTotalPrice().toString()}   ريال")),
      ),
    );
  }
}
