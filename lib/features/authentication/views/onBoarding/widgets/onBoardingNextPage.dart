import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper.dart';
import '../../../controllers/onBoardingController.dart';

class OnBoardingArrow extends StatelessWidget {
  const OnBoardingArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);

    return Positioned(
      left: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationHeight(),
      child: ElevatedButton(
        onPressed: () {
          Onboardingcontroller.instance.nextPage();
        },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: isDark ? TColors.primaryColor : TColors.dark),
        child: const Icon(Iconsax.arrow_left),
      ),
    );
  }
}
