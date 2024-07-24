import 'package:cloud_firestore/cloud_firestore.dart';

class ArtestCatagoryModel {
  final String artestId;
  final String categoryId;

  ArtestCatagoryModel({required this.artestId, required this.categoryId});

  Map<String, dynamic> toJson() {
    return {"ArtestId": artestId, "CategoryId": categoryId};
  }

  factory ArtestCatagoryModel.fromSnapShot(DocumentSnapshot snapShot) {
    final data = snapShot.data() as Map<String, dynamic>;
    return ArtestCatagoryModel(
      artestId: data["ArtestId"] as String,
      categoryId: data["CategoryId"] as String,
    );
  }
}
