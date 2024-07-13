import 'package:art_selling_platform/common/custom_shapes/Containers/circularContainer.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key,
    // required this.address,
    this.onTap,
  });

  // final AddressModel address;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // final controller = AddressController.intance;
    final bool isDark = THelperFunctions.isDarkMode(context);

    // final selectedAddressId = controller.selectedAddress.value.id;
    // final selectedAddress = address.id == selectedAddressId;
    return InkWell(
      onTap: onTap,
      child: TCircularContainer(
        width: double.infinity,
        showBorder: true,
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: TColors.primaryColor.withOpacity(0.5),
        borderColor: TColors.grey,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Stack(
          children: [
            Positioned(
              right: 5,
              top: 0,
              child: Icon(
                Iconsax.tick_circle5,
                color: TColors.dark,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Elias",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: TSizes.sm / 2),
                Text("772546343", maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: TSizes.sm / 2),
                Text(
                  "إب, شارع تعز,دار الشرف",
                  softWrap: true,
                ),
                const SizedBox(height: TSizes.sm / 2),
              ],
            )
          ],
        ),
      ),
    );
  }
}
