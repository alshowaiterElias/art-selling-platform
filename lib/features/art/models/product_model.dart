import 'package:art_selling_platform/features/art/models/artest_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  String title;
  String thumbNail;
  String? description;
  String? catagoryId;
  double price;
  double salePrice;
  DateTime? date;
  bool? isFeatured;
  ArtestModel? artest;

  ProductModel(
      {required this.id,
      required this.title,
      required this.thumbNail,
      required this.price,
      this.salePrice = 0.0,
      this.catagoryId,
      this.date,
      this.description,
      this.isFeatured,
      this.artest});

  static ProductModel empty() => ProductModel(
        id: "",
        title: "",
        thumbNail: "",
        price: 0,
      );

  toJson() {
    return {
      "Id": id,
      "IsFeatured": isFeatured,
      "Title": title,
      "ThumbNail": thumbNail,
      "Price": price,
      "SalePrice": salePrice,
      "CatagoryId": catagoryId,
      "Artest": artest!.toJson(),
      "Date": date,
      "Description": description,
    };
  }

  factory ProductModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return ProductModel(
      id: document.id,
      title: data["Title"],
      isFeatured: data["IsFeatured"] ?? false,
      price: double.parse((data["Price"] ?? 0.0).toString()),
      salePrice: double.parse((data["SalePrice"] ?? 0.0).toString()),
      thumbNail: data["ThumbNail"] ?? "",
      catagoryId: data["CatagoryId"] ?? "",
      description: data["Description"] ?? "",
      artest: ArtestModel.fromJson(data["Artest"]),
      date: data["Date"],
    );
  }

  factory ProductModel.fromQuerySnapShot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      title: data["Title"] ?? "",
      isFeatured: data["IsFeatured"] ?? false,
      price: double.parse((data["Price"] ?? 0.0).toString()),
      salePrice: double.parse((data["SalePrice"] ?? 0.0).toString()),
      thumbNail: data["ThumbNail"] ?? "",
      catagoryId: data["CatagoryId"] ?? "",
      description: data["Description"] ?? "",
      artest: ArtestModel.fromJson(data["Artest"]),
      date: data["Date"],
    );
  }
}
