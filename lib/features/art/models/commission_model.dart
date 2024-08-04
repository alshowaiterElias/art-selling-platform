import 'package:cloud_firestore/cloud_firestore.dart';

class CommissionModel {
  String id;
  final DateTime issueDate;
  final DateTime delivaryDate;
  final String status;
  final double price;

  CommissionModel({
    required this.id,
    required this.issueDate,
    required this.delivaryDate,
    required this.status,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "IssueDate": issueDate,
      "DelivaryDate": delivaryDate,
      "Status": status,
      "Price": price,
    };
  }

  factory CommissionModel.fromMap(Map<String, dynamic> data) {
    return CommissionModel(
      id: data["Name"] as String,
      issueDate: (data["IssueDate"] as Timestamp) as DateTime,
      delivaryDate: (data["DelivaryDate"] as Timestamp) as DateTime,
      price: data["Price"] as double,
      status: data["Status"] as String,
    );
  }

  factory CommissionModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return CommissionModel(
        issueDate: (data["IssueDate"] as Timestamp) as DateTime,
        delivaryDate: (data["DelivaryDate"] as Timestamp) as DateTime,
        price: data["Price"] as double,
        status: data["Status"] as String,
        id: snapshot.id);
  }
}
