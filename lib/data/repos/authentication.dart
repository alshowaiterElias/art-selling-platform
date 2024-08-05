import 'package:art_selling_platform/data/repos/user.dart';
import 'package:art_selling_platform/features/authentication/views/login/login.dart';
import 'package:art_selling_platform/features/authentication/views/onBoarding/on_boarding.dart';
import 'package:art_selling_platform/features/authentication/views/signup/verfiy_email.dart';
import 'package:art_selling_platform/nav.dart';
import 'package:art_selling_platform/utils/local_storage/local_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  //variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        await TLocalStorage.init(user.uid);
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerfiyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
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

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw "خطا في تسجيل الدخول";
    }
  }

  Future<void> sendEmailVerfication() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw 'خطا في إرسال الايميل';
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw ' خطا في إرسال البريد الالكتروني لاعادة ضبط كلمة المرور';
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      throw "حصل خطا في التسجيل عبر جوجل";
    }
  }

  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } catch (e) {
      throw "خطا في تاكيد حذفك للحساب";
    }
  }

  Future<void> deleteAccount() async {
    try {
      await UserRepo.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser!.delete();
    } catch (e) {
      throw "خطا في حذف الحساب";
    }
  }

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      throw 'خطا في تسجيل الخروج';
    }
  }
}
