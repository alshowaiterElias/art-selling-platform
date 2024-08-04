import 'package:art_selling_platform/common/custom_shapes/Containers/circularContainer.dart';
import 'package:art_selling_platform/common/texts/sectionHeader.dart';
import 'package:art_selling_platform/features/art/controllers/checkout_controller.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    return Column(
      children: [
        TSectionHeader(
          title: "طريقة الدفع",
          buttonTitle: "تغيير",
          showActionButton: true,
          onPressd: () {
            controller.selectPaymentMethod(context);
          },
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Obx(
          () => Row(
            children: [
              TCircularContainer(
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.light
                    : TColors.white,
                width: 60,
                height: 35,
                padding: const EdgeInsets.all(TSizes.sm),
                child: Image(
                  image: AssetImage(controller.selectedPayment.value.image),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems / 2),
              Text(
                controller.selectedPayment.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        ),
      ],
    );
  }
}
