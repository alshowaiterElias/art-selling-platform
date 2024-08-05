import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/on_boarding_controller.dart';

class OnBoardingDotNav extends StatelessWidget {
  const OnBoardingDotNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Onboardingcontroller.instance;
    final bool isDark = THelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationHeight() + 25,
      right: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(
            activeDotColor: isDark ? TColors.light : TColors.dark,
            dotHeight: 6),
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
