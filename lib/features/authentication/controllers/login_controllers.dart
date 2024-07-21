import 'package:art_selling_platform/data/repos/authentication.dart';
import 'package:art_selling_platform/features/personalization/controllers/user_controller.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:art_selling_platform/utils/network/networkManager.dart';
import 'package:art_selling_platform/utils/popups/fullScreenLoader.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  //variables
  final Rx<bool> rememberMe = true.obs;
  final Rx<bool> hidePassword = true.obs;
  final localStorage = GetStorage();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      //start Loading
      FullScreenLoader.openLoadingDialog(
          "... جاري تسجيل دخولك", TImageStrings.docerAnimation);

      //Check intrnet conictivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //save data if remember me

      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      //Login user with Email and Password authentecate
      await AuthenticationRepo.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      FullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepo.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
    }
  }

  Future<void> googleSingIn() async {
    try {
      // start loading
      FullScreenLoader.openLoadingDialog(
          "... جاري تسجيل دخولك", TImageStrings.docerAnimation);

      //check internet connictivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Google Authenticate
      final userCredential =
          await AuthenticationRepo.instance.signInWithGoogle();

      // save user data
      await userController.saveUserRecored(userCredential);

      //stop loading
      FullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepo.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
    }
  }
}
