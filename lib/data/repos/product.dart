import 'package:art_selling_platform/data/services/firebase_storage_service.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class ProductRepo extends GetxController {
  static ProductRepo get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  Future<void> uploadDummyData(List<ProductModel> products) async {
    final storage = Get.put(FirebaseStorageService());

    for (var product in products) {
      final thumbNail = await storage.getImageDataFromAsset(product.thumbNail);

      final url = await storage.uploadImageData(
          "Products/Images", thumbNail, product.thumbNail.toString());
      product.thumbNail = url;

      await _db.collection("Products").doc(product.id).set(product.toJson());
    }
  }

  //get featured produucts
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapShot = await _db
          .collection("Products")
          .where("IsFeatured", isEqualTo: true)
          .limit(6)
          .get();
      return snapShot.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
    } catch (e) {
      throw "خطا في تنزيل اللوحات المعروضة";
    }
  }

  //get All produucts
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final snapShot = await _db
          .collection("Products")
          .where("IsFeatured", isEqualTo: true)
          .get();
      return snapShot.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
    } catch (e) {
      throw "خطا في تنزيل جميع اللوحات";
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapShot(doc))
          .toList();
      return productList;
    } catch (e) {
      throw 'خطا في تنزيل اللوحات عن طريق الاستعلام';
    }
  }

  Future<List<ProductModel>> getProdcutsForArtest(
      {required String artestId, int limit = -1}) async {
    try {
      final querySnapShot = limit == -1
          ? await _db
              .collection("Products")
              .where("Artest.Id", isEqualTo: artestId)
              .get()
          : await _db
              .collection("Products")
              .where("Artest.Id", isEqualTo: artestId)
              .limit(limit)
              .get();
      final products = querySnapShot.docs
          .map((prodcut) => ProductModel.fromQuerySnapShot(prodcut))
          .toList();
      return products;
    } catch (e) {
      throw "خطا في تنزيل لوحات الفنان";
    }
  }

  Future<List<ProductModel>> getProductsForCatagory(
      {required catagoryId, int limit = -1}) async {
    try {
      final productCatagoryQuery = limit == -1
          ? await _db
              .collection("ProductCategory")
              .where("CategoryId", isEqualTo: catagoryId)
              .get()
          : await _db
              .collection("ProductCategory")
              .where("CategoryId", isEqualTo: catagoryId)
              .limit(limit)
              .get();
      List<String> productIds = productCatagoryQuery.docs
          .map((e) => e["ProductId"] as String)
          .toList();

      if (productIds.isEmpty) return [];

      final productQuery = await _db
          .collection("Products")
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      List<ProductModel> products =
          productQuery.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
      return products;
    } catch (e) {
      throw "خطا في تنزيل لوحات هذا الصنف";
    }
  }

  Future<List<ProductModel>> getFavouritesProducts(
      List<String> productIds) async {
    try {
      if (productIds.isEmpty) return [];
      final snapshot = await _db
          .collection("Products")
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
    } catch (e) {
      throw "Error";
    }
  }
}
