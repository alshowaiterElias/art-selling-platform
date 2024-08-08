import 'package:art_selling_platform/data/repos/authentication.dart';
import 'package:art_selling_platform/data/repos/chat.dart';
import 'package:art_selling_platform/features/art/models/message_model.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  static MessageController get instance => Get.find();

  //variables
  final messageText = TextEditingController();
  final chatRepo = Get.put(ChatRepo());
  final isLoading = false.obs;
  final RxList<MessageModel> messages = <MessageModel>[].obs;

  //functions

  Future<void> sendMessage(String reciverId) async {
    if (messageText.text.isNotEmpty) {
      try {
        final timestamp = Timestamp.now();
        MessageModel message = MessageModel(
            senderId: AuthenticationRepo.instance.authUser!.uid,
            senderEmail: AuthenticationRepo.instance.authUser!.email ?? "",
            reciverId: reciverId,
            message: messageText.text,
            timestamp: timestamp);

        List<String> ids = [
          AuthenticationRepo.instance.authUser!.uid,
          reciverId
        ];
        ids.sort();
        String chatroomId = ids.join("_");
        await chatRepo.sendMessage(message, chatroomId);
        messageText.clear();
        messages.add(message);
        messages.refresh();
      } catch (e) {
        TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
      }
    } else {
      TLoaders.warningSnackBar(
          title: "تحذير", message: "لا يمكن ارسال رسائل فارغة");
    }
  }

  Future<void> getMessages(String artestId, String userId) async {
    try {
      isLoading.value = true;
      final messages = await chatRepo.getMessages(artestId, userId);
      this.messages.assignAll(messages);
      this.messages.refresh();
    } catch (e) {
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
