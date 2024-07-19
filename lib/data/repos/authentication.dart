import 'package:art_selling_platform/features/authentication/views/login/login.dart';
import 'package:art_selling_platform/features/authentication/views/onBoarding/onBoarding.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  //variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  void screenRedirect() async {
    //local storage
    //explaination: if the user is opening the application for the first time
    // ever the value will be written as true so he is directed to the on boarding true
    // because true == false is fasle, but if he reaches the final page of the onBoarding
    // and presses the arrow it changes to false (check onBoarding Controller) resulting
    // in alaways getting directed to the login screen
    deviceStorage.writeIfNull("FirstTimeOpening", true);
    deviceStorage.read("FirstTimeOpening") == false
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoarding());
  }

  Future<UserCredential> registerUserWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw 'خطأ بتسجيل الحساب';
    }
  }
}
