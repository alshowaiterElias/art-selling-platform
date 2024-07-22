import 'package:art_selling_platform/data/services/firebase_storage_service.dart';
import 'package:art_selling_platform/features/art/models/banner_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BannerRepo extends GetxController {
  static BannerRepo get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //Get all order related to current user
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection("Banners")
          .where("active", isEqualTo: true)
          .get();
      return result.docs
          .map((banner) => BannerModel.fromSnapShot(banner))
          .toList();
    } catch (e) {
      throw "خطا في تنزيل الاعلانات";
    }
  }

  // upload banners
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    //upload catagory with their images
    final storage = Get.put(FirebaseStorageService());

    //loop through catagories
    for (var banner in banners) {
      final file = await storage.getImageDataFromAsset(banner.imageUrl);
      final url = await storage.uploadImageData(
          "Banners", file, banner.imageUrl.toString());
      banner.imageUrl = url;
      await _db.collection("Banners").add(banner.toJson());
    }
  }
}
