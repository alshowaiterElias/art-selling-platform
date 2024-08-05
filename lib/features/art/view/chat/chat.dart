import 'package:art_selling_platform/common/appbar/app_bar.dart';
import 'package:art_selling_platform/data/repos/authentication.dart';
import 'package:art_selling_platform/features/art/controllers/message_controller.dart';
import 'package:art_selling_platform/features/art/models/artest_model.dart';
import 'package:art_selling_platform/features/art/models/message_model.dart';
import 'package:art_selling_platform/features/art/view/chat/widgets/chat_bubble.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.artest});

  final ArtestModel artest;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MessageController());
    controller.getMessages(
        artest.id, AuthenticationRepo.instance.authUser!.uid);
    return Scaffold(
        appBar: TAppbar(
          title: Text(
            artest.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    return _buildMessageItem(controller.messages[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          await controller.sendMessage(artest.id);
                        },
                        icon: const Icon(
                          Icons.arrow_upward,
                          size: 40,
                        )),
                    Expanded(
                      child: TextField(
                        controller: controller.messageText,
                        obscureText: false,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems)
            ],
          );
        }));
  }
}

Widget _buildMessageItem(MessageModel message) {
  var alignment =
      (message.senderId == AuthenticationRepo.instance.authUser!.uid)
          ? Alignment.centerLeft
          : Alignment.centerRight;

  return Container(
    alignment: alignment,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            (message.senderId == AuthenticationRepo.instance.authUser!.uid)
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
        mainAxisAlignment:
            (message.senderId == AuthenticationRepo.instance.authUser!.uid)
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
        children: [
          Text(message.senderEmail),
          const SizedBox(height: TSizes.sm),
          ChatBubble(message: message.message)
        ],
      ),
    ),
  );
}
