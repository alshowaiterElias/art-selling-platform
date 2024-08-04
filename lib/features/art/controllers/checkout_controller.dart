import 'package:art_selling_platform/common/cart/payment_tile.dart';
import 'package:art_selling_platform/common/texts/sectionHeader.dart';
import 'package:art_selling_platform/features/personalization/models/payment_method_model.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();
  Rx<PaymentMethodModel> selectedPayment = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPayment.value =
        PaymentMethodModel(image: TImageStrings.lightLogo, name: "Paypal");
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSectionHeader(
                title: "اختر طريقة الدفع",
                showActionButton: false,
                onPressd: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TPaymentTile(
                  payment: PaymentMethodModel(
                      image: TImageStrings.lightLogo, name: "Paypal")),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(
                  payment: PaymentMethodModel(
                      image: TImageStrings.lightLogo, name: "Kuraimi")),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(
                  payment: PaymentMethodModel(
                      image: TImageStrings.lightLogo, name: "OneCash")),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(
                  payment: PaymentMethodModel(
                      image: TImageStrings.lightLogo, name: "Master Card")),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
            ],
          ),
        ),
      ),
    );
  }
}
