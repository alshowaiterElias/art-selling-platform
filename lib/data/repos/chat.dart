import 'package:art_selling_platform/features/art/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatRepo extends GetxController {
  static ChatRepo get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //send message
  Future<void> sendMessage(MessageModel message, String chatroomId) async {
    try {
      await _db
          .collection("ChatRoom")
          .doc(chatroomId)
          .collection("Messages")
          .add(message.toJson());
    } catch (e) {
      throw 'خطا في رفع الرسالة';
    }
  }

  // get messages
  Future<List<MessageModel>> getMessages(
      String userId, String otherPersonId) async {
    try {
      List<String> ids = [userId, otherPersonId];
      ids.sort();
      String chatroomId = ids.join("_");

      final result = await _db
          .collection("ChatRoom")
          .doc(chatroomId)
          .collection("Messages")
          .orderBy("Timestamp", descending: false)
          .get();
      return result.docs.map((e) => MessageModel.fromSnapShot(e)).toList();
    } catch (e) {
      throw 'خطا في تنزيل الرسائل';
    }
  }
}
