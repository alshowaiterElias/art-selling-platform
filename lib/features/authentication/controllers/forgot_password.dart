import 'package:art_selling_platform/data/repos/authentication.dart';
import 'package:art_selling_platform/features/authentication/views/password_config/reset_password.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:art_selling_platform/utils/network/network_manager.dart';
import 'package:art_selling_platform/utils/popups/full_screen_loader.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  //variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  Future sendPasswordResetEmail() async {
    try {
      FullScreenLoader.openLoadingDialog(
          "... جاري معالجة طلبك", TImageStrings.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //send email
      await AuthenticationRepo.instance
          .sendPasswordResetEmail(email.text.trim());

      //remove loader
      FullScreenLoader.stopLoading();

      //Message
      TLoaders.successSnackBar(
          title: "تم الارسال",
          message: "قم بزيارة بريدك الالكتروني لاعادة ضبط كلمة المرور".tr);

      //redirect
      Get.to(() => ResetpasswordScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TLoaders.errorSnackBar(title: "خطأ", message: e.toString());
    }
  }

  Future resendPasswordResetEmail(String email) async {
    try {
      FullScreenLoader.openLoadingDialog(
          "... جاري معالجة طلبك", TImageStrings.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //send email
      await AuthenticationRepo.instance.sendPasswordResetEmail(email);

      //remove loader
      FullScreenLoader.stopLoading();

      //Message
      TLoaders.successSnackBar(
          title: "تم الارسال",
          message: "قم بزيارة بريدك الالكتروني لاعادة ضبط كلمة المرور".tr);
    } catch (e) {
      TLoaders.errorSnackBar(title: "خطأ", message: e.toString());
    }
  }
}
