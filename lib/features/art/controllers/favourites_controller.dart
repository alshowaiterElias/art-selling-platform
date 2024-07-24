import 'dart:convert';

import 'package:art_selling_platform/data/repos/product.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:art_selling_platform/utils/local_storage/localStorage.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  //variable
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  Future<void> initFavourites() async {
    final json = TLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map(
        (key, value) => MapEntry(key, value as bool),
      ));
    }
  }

  bool isFavourites(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouritesProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesToStorage();
      TLoaders.customToast(message: "تمت الاضافة الى المفضلة");
    } else {
      TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      TLoaders.customToast(message: "تمت الازالة من المفضلة");
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().saveData("favourites", encodedFavourites);
  }

  Future<List<ProductModel>> favouritesProducts() async {
    return await ProductRepo.instance
        .getFavouritesProducts(favourites.keys.toList());
  }
}
