import 'package:art_selling_platform/data/services/firebase_storage_service.dart';
import 'package:art_selling_platform/features/art/models/artest_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ArtestsRepo extends GetxController {
  static ArtestsRepo get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  Future<List<ArtestModel>> getAllArtests() async {
    try {
      final snapShot = await _db.collection("Artests").get();
      final result = snapShot.docs
          .map((artest) => ArtestModel.fromSnapShot(artest))
          .toList();
      return result;
    } catch (e) {
      throw "خطا في تنزيل الفنانين";
    }
  }

  Future<void> uploadDummyData(List<ArtestModel> artests) async {
    try {
      final storage = Get.put(FirebaseStorageService());

      for (var artest in artests) {
        final file = await storage.getImageDataFromAsset(artest.image);
        final url = await storage.uploadImageData("Artests", file, artest.name);
        artest.image = url;
        await _db.collection("Artests").doc(artest.id).set(artest.toJson());
      }
    } catch (e) {
      throw "خطا في رفع بيانات الفنانين";
    }
  }

  Future<List<ArtestModel>> getArtestsForCatagory(String catagoryId) async {
    try {
      QuerySnapshot artestCatagoryQuery = await _db
          .collection("ArtestCategory")
          .where("CategoryId", isEqualTo: catagoryId)
          .get();
      List<String> artestIds = artestCatagoryQuery.docs
          .map((doc) => doc['ArtestId'] as String)
          .toList();
      final artestsQuery = await _db
          .collection("Artests")
          .where(FieldPath.documentId, whereIn: artestIds)
          .limit(2)
          .get();

      List<ArtestModel> artests = artestsQuery.docs
          .map((doc) => ArtestModel.fromSnapShot(doc))
          .toList();
      return artests;
    } catch (e) {
      throw "خطا في تنزيل فنانين هذا الصنف";
    }
  }
}
