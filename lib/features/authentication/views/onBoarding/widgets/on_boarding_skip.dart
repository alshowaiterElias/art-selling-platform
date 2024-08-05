import 'package:art_selling_platform/features/authentication/controllers/on_boarding_controller.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppbarHeight(),
      left: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () {
          Onboardingcontroller.instance.skipPage();
        },
        child: Text(
          "تخطي",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .apply(color: TColors.primaryColor),
        ),
      ),
    );
  }
}
