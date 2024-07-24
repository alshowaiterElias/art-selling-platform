import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String productId;
  final String catagoryId;

  ProductCategoryModel({required this.productId, required this.catagoryId});

  Map<String, dynamic> toJson() {
    return {"ProductId": productId, "CategoryId": catagoryId};
  }

  factory ProductCategoryModel.fromSnapShot(DocumentSnapshot snapShot) {
    final data = snapShot.data() as Map<String, dynamic>;
    return ProductCategoryModel(
      productId: data["ProductId"] as String,
      catagoryId: data["CategoryId"] as String,
    );
  }
}
