import 'package:art_selling_platform/data/repos/product.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  //variables
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final isLoading = false.obs;
  final productRepo = Get.put(ProductRepo());

  @override
  void onInit() {
    fetchFeaturedProduct();
    super.onInit();
  }

  void fetchFeaturedProduct() async {
    try {
      isLoading.value = true;

      final products = await productRepo.getFeaturedProducts();

      featuredProducts.assignAll(products);
      isLoading.value = false;
    } catch (e) {
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProduct() async {
    try {
      final products = await productRepo.getAllProducts();

      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    return (product.salePrice > 0 ? product.salePrice : product.price)
        .toString();
  }

  String? calculateSalePrecentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0) {
      return null;
    }
    double precentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return precentage.toStringAsFixed(0);
  }
}
