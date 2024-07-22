import 'package:cloud_firestore/cloud_firestore.dart';

class ArtestModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  String phoneNumber;

  ArtestModel(
      {required this.id,
      required this.name,
      required this.image,
      this.isFeatured,
      required this.phoneNumber});

  static ArtestModel empty() =>
      ArtestModel(id: "", name: "", image: "", phoneNumber: "");

  toJson() {
    return {
      "Id": id,
      "Name": name,
      "Image": image,
      "IsFeatured": isFeatured,
      "PhoneNumber": phoneNumber
    };
  }

  factory ArtestModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ArtestModel.empty();
    return ArtestModel(
        id: data["Id"] ?? "",
        name: data["Name"] ?? "",
        image: data["Image"] ?? "",
        isFeatured: data["IsFeatured"] ?? false,
        phoneNumber: data["PhoneNumber"] ?? "");
  }

  factory ArtestModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ArtestModel(
          id: document.id,
          name: data["Name"] ?? "",
          image: data["Image"] ?? "",
          isFeatured: data["IsFeatured"] ?? false,
          phoneNumber: data["PhoneNumber"] ?? "");
    } else {
      return ArtestModel.empty();
    }
  }
}
