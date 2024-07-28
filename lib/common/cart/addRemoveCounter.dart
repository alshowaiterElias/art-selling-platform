import 'package:art_selling_platform/common/icons/TCircularIcon.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class TAddRemoveCounter extends StatelessWidget {
  const TAddRemoveCounter({
    super.key,
    this.remove,
  });

  final VoidCallback? remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.balck,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
          onPressed: remove,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        GestureDetector(
          onTap: remove,
          child: Text("حذف ",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(color: TColors.error)),
        ),
      ],
    );
  }
}
