import 'package:art_selling_platform/data/repos/catagory.dart';
import 'package:art_selling_platform/features/art/models/catagory_model.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:get/get.dart';

class CatagoryController extends GetxController {
  static CatagoryController get instance => Get.find();
  final _catagoryRepo = Get.put(CatagoryRepo());
  final RxList<CategoryModel> allCatagories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCatagories = <CategoryModel>[].obs;

  final isLoading = false.obs;
  @override
  void onInit() {
    fetchCatagories();
    super.onInit();
  }

  //load catagory data
  Future<void> fetchCatagories() async {
    try {
      //show loader
      isLoading.value = true;
      //fetch from data source
      final catagories = await _catagoryRepo.getAllCatagories();
      //update the catagory list
      allCatagories.assignAll(catagories);
      //filter featured catagory
      featuredCatagories.assignAll(allCatagories
          .where((catagory) => catagory.isFeatured && catagory.parentId.isEmpty)
          .take(8));
    } catch (e) {
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
    } finally {
      //remove loader
      isLoading.value = false;
    }
  }

  //load selected catagory data
  Future<List<CategoryModel>> getSubCatagories(String catagoryId) async {
    try {
      final subCatagories = await _catagoryRepo.getSubCatagories(catagoryId);
      return subCatagories;
    } catch (e) {
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
      return [];
    }
  }

  //get catagory or subcatagory products
  // Future<List<ProductModel>> getCatagoryProduct(
  //     {required String catagoryId, int limit = 4}) async {
  //   final products = await ProductRepo.instance
  //       .getProductsForCatagory(catagoryId: catagoryId, limit: limit);
  //   return products;
  // }
}
