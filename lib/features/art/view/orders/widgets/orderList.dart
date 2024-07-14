import 'package:art_selling_platform/common/custom_shapes/Containers/circularContainer.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(OrderController());

    final bool isDark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
        itemBuilder: (_, index) {
          return TCircularContainer(
            showBorder: true,
            backgroundColor: isDark ? TColors.dark : TColors.light,
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Row 1
                Row(
                  children: [
                    const Icon(Iconsax.ship),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("تاريخ الوصول",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(
                                      color: TColors.primaryColor,
                                      fontWeightDelta: 1)),
                          Text("21 Nov,2024",
                              style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.arrow_right_34,
                          size: TSizes.iconsSm,
                        ))
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Iconsax.tag),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("رقم الطلب",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium),
                                Text("10jk30",
                                    maxLines: 1,
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Iconsax.calendar),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("تاريخ الشحن",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium),
                                Text("14 Nov, 2024",
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
        itemCount: 6);
  }
}
