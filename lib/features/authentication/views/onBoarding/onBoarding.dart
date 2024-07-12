import 'package:art_selling_platform/features/authentication/views/onBoarding/widgets/onBoardingDotNav.dart';
import 'package:art_selling_platform/features/authentication/views/onBoarding/widgets/onBoardingNextPage.dart';
import 'package:art_selling_platform/features/authentication/views/onBoarding/widgets/onBoardingPage_scroll.dart';
import 'package:art_selling_platform/features/authentication/views/onBoarding/widgets/onBoardingSkip.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/onBoardingController.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final constroller = Get.put(Onboardingcontroller());

    return Scaffold(
      body: Stack(
        //Horizantal scrollable pages
        children: [
          PageView(
            reverse: true,
            controller: constroller.pageController,
            onPageChanged: constroller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImageStrings.onBoaringImage4,
                title: "اصنع إسمك الفني ",
                subtitle:
                    "يمكنك الان نشر جميع اعمالك الفنية و استعراض ما يمتلكه الاخرون",
              ),
              OnBoardingPage(
                image: TImageStrings.onBoaringImage1,
                title: "قم بعرض مهاراتك في الفن",
                subtitle: "الان امامك فرصة لعرض قدارتك الفنية امام الاخرين ",
              ),
              OnBoardingPage(
                image: TImageStrings.onBoaringImage3,
                title: "اقتني ما تريد من الفن",
                subtitle: "يمكنك شراء او عرض ما تريد من فنون ",
              ),
            ],
          ),

          //skip button
          const OnBoardingSkip(),
          //dot navigation
          const OnBoardingDotNav(),
          // circular button
          const OnBoardingArrow()
        ],
      ),
    );
  }
}