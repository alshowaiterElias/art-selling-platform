import 'package:art_selling_platform/common/texts/section_header.dart';
import 'package:art_selling_platform/features/personalization/controllers/address_controller.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.intance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeader(
          title: "عنوان الشحن",
          buttonTitle: "تغيير",
          onPressd: () {
            controller.selectNewAddressPopup(context);
          },
        ),
        controller.selectedAddress.value.id.isNotEmpty
            ? Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.selectedAddress.value.name,
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.phone,
                            color: Colors.grey, size: TSizes.iconsMd),
                        const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                        Text(controller.selectedAddress.value.phoneNumber,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.location_history,
                            color: Colors.grey, size: TSizes.iconsMd),
                        const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                        Expanded(
                          child: Text(
                            controller.selectedAddress.value.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Text(
                "Select Address",
                style: Theme.of(context).textTheme.bodyMedium,
              )
      ],
    );
  }
}