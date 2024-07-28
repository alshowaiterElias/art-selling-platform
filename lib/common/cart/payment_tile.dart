import 'package:art_selling_platform/common/custom_shapes/Containers/circularContainer.dart';
import 'package:art_selling_platform/features/art/controllers/checkout_controller.dart';
import 'package:art_selling_platform/features/personalization/models/payment_method_model.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TPaymentTile extends StatelessWidget {
  const TPaymentTile({
    super.key,
    required this.payment,
  });

  final PaymentMethodModel payment;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPayment.value = payment;
        Get.back();
      },
      leading: TCircularContainer(
        width: 60,
        height: 40,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.light
            : TColors.white,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Image(
          image: AssetImage(TImageStrings.lightLogo),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(payment.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
