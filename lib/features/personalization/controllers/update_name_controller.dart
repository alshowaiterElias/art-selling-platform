import 'package:art_selling_platform/data/repos/user.dart';
import 'package:art_selling_platform/features/personalization/controllers/user_controller.dart';
import 'package:art_selling_platform/features/personalization/views/profile/profile.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:art_selling_platform/utils/network/networkManager.dart';
import 'package:art_selling_platform/utils/popups/fullScreenLoader.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  GlobalKey<FormState> updateUserNameKey = GlobalKey<FormState>();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final userController = UserController.instance;
  final userRepo = Get.put(UserRepo());

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstname.text = userController.user.value.firstname;
    lastname.text = userController.user.value.lastname;
  }

  Future<void> updateUserName() async {
    try {
      FullScreenLoader.openLoadingDialog(
          "... جاري تعديل البيانات", TImageStrings.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!updateUserNameKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //update on Firestore
      Map<String, dynamic> name = {
        "FirstName": firstname.text.trim(),
        "LastName": lastname.text.trim()
      };
      await userRepo.updateUserField(name);

      //update on profile screen
      userController.user.value.firstname = firstname.text.trim();
      userController.user.value.lastname = lastname.text.trim();

      //stop loading
      FullScreenLoader.stopLoading();

      //show message & redirect
      TLoaders.successSnackBar(title: "مبروك", message: "تم تعديل الاسم");
      Get.offAll(() => const ProfileScreen());
    } catch (e) {
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
    }
  }
}
