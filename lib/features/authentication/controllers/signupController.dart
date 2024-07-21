import 'package:art_selling_platform/data/repos/authentication.dart';
import 'package:art_selling_platform/data/repos/user.dart';
import 'package:art_selling_platform/features/authentication/models/userModel.dart';
import 'package:art_selling_platform/features/authentication/views/signup/verfiy_Email.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:art_selling_platform/utils/network/networkManager.dart';
import 'package:art_selling_platform/utils/popups/fullScreenLoader.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final Rx<bool> hidePassword = true.obs;
  final Rx<bool> tickCheckBox = true.obs;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //SignUp
  void signUp() async {
    try {
      //start Loading
      FullScreenLoader.openLoadingDialog(
          "... نحن نعالج طلبك الان", TImageStrings.docerAnimation);
      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();

        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();

        return;
      }

      //privacy policy
      if (tickCheckBox.value == false) {
        TLoaders.warningSnackBar(
            title: "الموافقة على سياسات الخصوصية",
            message:
                "لتكمل تسجيل حسابك عليك تأكيد الموافقة على سياسات الخصوصية و شروط الاستخدام");
        return;
      }

      //register user in FB authentication

      final userCredential = await AuthenticationRepo.instance
          .registerUserWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save user data in FS

      final userModel = UserModel(
          id: userCredential.user!.uid,
          firstname: firstname.text.trim(),
          lastname: lastname.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: "");

      final userRepo = Get.put(UserRepo());
      await userRepo.saveUserRecord(userModel);

      //Remove Loader
      FullScreenLoader.stopLoading();

      //show success message

      TLoaders.successSnackBar(
          title: "أحسنت",
          message: "انت الان على بعد خطوة واحدة من تاكيد حسابك");
      //move to verify email
      Get.to(() => VerfiyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      //show error message
      FullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
