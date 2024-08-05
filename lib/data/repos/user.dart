import 'dart:io';

import 'package:art_selling_platform/data/repos/authentication.dart';
import 'package:art_selling_platform/features/authentication/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  //variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //function to save user record to db
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } catch (e) {
      throw 'خطأ بإضافة الحساب';
    }
  }

  //Fetch user details based on id
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepo.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapShot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      throw 'خطا في تنزيل البيانات';
    }
  }

  // update user
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepo.instance.authUser?.uid)
          .update(updatedUser.toJson());
    } catch (e) {
      throw 'خطا في تعديل البيانات';
    }
  }

  //update a field
  Future<void> updateUserField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepo.instance.authUser?.uid)
          .update(json);
    } catch (e) {
      throw 'خطا في تعديل البيانات';
    }
  }

  //remove user from FS
  Future<void> removeUserRecord(String userID) async {
    try {
      await _db.collection("Users").doc(userID).delete();
    } catch (e) {
      throw 'خطا في حذف المستخدم';
    }
  }

  //Upload Image

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw 'خطا في رفع الصورة';
    }
  }
}
