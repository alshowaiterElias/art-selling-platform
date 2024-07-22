import 'package:art_selling_platform/data/services/firebase_storage_service.dart';
import 'package:art_selling_platform/features/art/models/catagory_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class CatagoryRepo extends GetxController {
  static CatagoryRepo get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //Get all Catagories
  Future<List<CategoryModel>> getAllCatagories() async {
    try {
      final snapShot = await _db.collection("Catagories").get();
      return snapShot.docs
          .map((document) => CategoryModel.fromSnapShot(document))
          .toList();
    } catch (e) {
      throw 'خطا في تنزيل الاصناف';
    }
  }

  //Get sub catagories
  Future<List<CategoryModel>> getSubCatagories(String catagoryId) async {
    try {
      final snapshot = await _db
          .collection("Catagories")
          .where("ParentId", isEqualTo: catagoryId)
          .get();
      final result =
          snapshot.docs.map((e) => CategoryModel.fromSnapShot(e)).toList();
      return result;
    } catch (e) {
      throw "خطا في تنزيل فروع الاصناف ";
    }
  }

  //upload catagories
  Future<void> uploadDummyData(List<CategoryModel> catagories) async {
    //upload catagory with their images
    final storage = Get.put(FirebaseStorageService());

    //loop through catagories
    for (var catagory in catagories) {
      final file = await storage.getImageDataFromAsset(catagory.image);
      final url =
          await storage.uploadImageData("Catagories", file, catagory.name);
      catagory.image = url;
      await _db
          .collection("Catagories")
          .doc(catagory.id)
          .set(catagory.toJson());
    }
  }
}
