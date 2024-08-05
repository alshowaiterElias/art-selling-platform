import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderId;
  final String senderEmail;
  final String reciverId;
  final String message;
  final Timestamp timestamp;

  MessageModel({
    required this.senderId,
    required this.senderEmail,
    required this.reciverId,
    required this.message,
    required this.timestamp,
  });

  toJson() {
    return {
      "SenderId": senderId,
      "SenderEmail": senderEmail,
      "ReciverId": reciverId,
      "Message": message,
      "Timestamp": timestamp
    };
  }

  static MessageModel empty() => MessageModel(
      senderId: "",
      senderEmail: "",
      reciverId: "",
      message: "",
      timestamp: "" as Timestamp);

  factory MessageModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    return MessageModel(
        senderId: data["SenderId"] ?? "",
        senderEmail: data["SenderEmail"] ?? "",
        message: data["Message"] ?? "",
        reciverId: data["ReciverId"] ?? false,
        timestamp: data["Timestamp"] ?? "");
  }

  factory MessageModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return MessageModel(
          senderId: data["SenderId"] ?? "",
          senderEmail: data["SenderEmail"] ?? "",
          message: data["Message"] ?? "",
          reciverId: data["ReciverId"] ?? false,
          timestamp: data["Timestamp"] ?? "");
    } else {
      return MessageModel.empty();
    }
  }
}
