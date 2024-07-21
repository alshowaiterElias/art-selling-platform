import 'dart:async';

import 'package:art_selling_platform/data/repos/authentication.dart';
import 'package:art_selling_platform/features/authentication/views/signup/widgets/success_Screen.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerfiyEmailController extends GetxController {
  static VerfiyEmailController get instance => Get.find();

  //send email whenever verfiy screen appears & set timer to auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerToAutoRedirect();
    super.onInit();
  }

  //send email verfication link
  sendEmailVerification() async {
    try {
      await AuthenticationRepo.instance.sendEmailVerfication();
      TLoaders.successSnackBar(
          title: "تم ارسال الايميل",
          message: "الرجاء الذهاب لتاكيد حسابك عن طريق الرابط المرسل اليكم");
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  //timer to auto redirct
  setTimerToAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => Successscreen(
            image: TImageStrings.emailConfirmed,
            title: "تم انشاء حسابك",
            subtitle: "يمكنك الان الاستمتاع بخدمات هذا البرنامج",
            onPressed: () {
              AuthenticationRepo.instance.screenRedirect();
            }));
      }
    });
  }

  //manually check if email is verfied
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => Successscreen(
          image: TImageStrings.emailConfirmed,
          title: "تم انشاء حسابك",
          subtitle: "يمكنك الان الاستمتاع بخدمات هذا البرنامج",
          onPressed: () {
            AuthenticationRepo.instance.screenRedirect();
          }));
    }
  }
}
