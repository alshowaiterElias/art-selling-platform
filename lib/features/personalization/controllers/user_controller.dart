import 'package:art_selling_platform/data/repos/authentication.dart';
import 'package:art_selling_platform/data/repos/user.dart';
import 'package:art_selling_platform/features/authentication/models/userModel.dart';
import 'package:art_selling_platform/features/authentication/views/login/login.dart';
import 'package:art_selling_platform/features/personalization/views/profile/widgets/re_authenticate_user.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:art_selling_platform/utils/network/networkManager.dart';
import 'package:art_selling_platform/utils/popups/fullScreenLoader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  final imageLoading = false.obs;
  final userRepo = Get.put(UserRepo());
  final verfiyEmail = TextEditingController();
  final verfiyPassword = TextEditingController();
  final hidePassword = false.obs;
  GlobalKey<FormState> deleteUserFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepo.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecored(UserCredential? userCredential) async {
    try {
      //refresh user
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? "");
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? "");

          final user = UserModel(
              id: userCredential.user!.uid,
              firstname: nameParts[0],
              lastname:
                  nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
              username: username,
              email: userCredential.user!.email ?? "",
              phoneNumber: userCredential.user!.phoneNumber ?? "",
              profilePicture: userCredential.user!.photoURL ?? "");

          await userRepo.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: "لم يتم حفظ البيانات",
          message:
              "حصل خطا في حفظ البيانات, يمكنك اعادة ادخال البيانات من صفحة المستخدم");
    }
  }

  void deleteUserWarningPopUp() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: "حذف الحساب",
        middleText:
            "هل انت متاكد من حذف الحساب, هذه العملية لايمكن التراجع عنها",
        confirm: ElevatedButton(
            onPressed: () {
              deleteUserAccount();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
                child: Text("حذف"))),
        cancel: OutlinedButton(
            onPressed: () {
              Navigator.of(Get.overlayContext!).pop();
            },
            child: const Text("تراجع")));
  }

  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog(
          ".... جاري حذف حسابك", TImageStrings.docerAnimation);
      //First re-Authenticate user
      final auth = AuthenticationRepo.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re Verfiy Email
        if (provider == "google.com") {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          await AuthenticationRepo.instance.logout();
        } else if (provider == "password") {
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthenticateUser());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPassowrdThenDelete() async {
    try {
      FullScreenLoader.openLoadingDialog(
        ".... جاري حذف حسابك  ",
        TImageStrings.docerAnimation,
      );

      //Check intrnet conictivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {}

      // validate
      if (!deleteUserFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepo.instance.reAuthenticateWithEmailAndPassword(
          verfiyEmail.text.trim(), verfiyPassword.text.trim());
      await AuthenticationRepo.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  uploadProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageLoading.value = true;
        //upload image
        final imageUrl =
            await UserRepo.instance.uploadImage("Users/Images/Profile/", image);

        //update user image
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await UserRepo.instance.updateUserField(json);

        //update frontend
        user.value.profilePicture = imageUrl;
        user.refresh();
        //snackbar
        TLoaders.successSnackBar(
            title: "مبروك", message: "تم تعديل صورتك الشخصية");
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
    } finally {
      imageLoading.value = false;
    }
  }
}
