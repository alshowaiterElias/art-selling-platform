import 'package:art_selling_platform/data/repos/artests.dart';
import 'package:art_selling_platform/data/repos/product.dart';
import 'package:art_selling_platform/features/art/models/artest_model.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:get/get.dart';

class ArtestController extends GetxController {
  static ArtestController get instance => Get.find();

  final RxList<ArtestModel> allArtests = <ArtestModel>[].obs;
  final RxList<ArtestModel> featuredArtests = <ArtestModel>[].obs;
  final artestsRepo = Get.put(ArtestsRepo());
  final isLoading = false.obs;

  @override
  void onInit() {
    getFeaturedArtests();
    super.onInit();
  }

  //load Artests
  Future<void> getFeaturedArtests() async {
    try {
      isLoading.value = true;
      final artests = await artestsRepo.getAllArtests();
      allArtests.assignAll(artests);
      featuredArtests.assignAll(
          artests.where((artest) => artest.isFeatured ?? false).take(4));
    } catch (e) {
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //get artests for catagory
  Future<List<ArtestModel>> getArtestsForCatagory(String catagoryId) async {
    try {
      final artests = await artestsRepo.getArtestsForCatagory(catagoryId);
      return artests;
    } catch (e) {
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
      return [];
    }
  }

  //get artest specific products
  Future<List<ProductModel>> getArtestProducts(
      {required String artestId, int limit = -1}) async {
    try {
      final products = await ProductRepo.instance
          .getProdcutsForArtest(artestId: artestId, limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
      return [];
    }
  }
}
