import 'package:art_selling_platform/features/authentication/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboardingcontroller extends GetxController {
  static Onboardingcontroller get instance => Get.find();

  //variables
  PageController pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  //functions
  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.to(() => const LoginScreen());
    } else {
      pageController.jumpToPage(currentPageIndex.value + 1);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
