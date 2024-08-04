import 'package:art_selling_platform/data/repos/authentication.dart';
import 'package:art_selling_platform/features/art/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class OrderRepo extends GetxController {
  static OrderRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepo.instance.authUser!.uid;
      if (userId.isEmpty) throw "خطا في المستخدم";

      final result =
          await _db.collection("Users").doc(userId).collection("Orders").get();

      return result.docs.map((e) => OrderModel.fromSnapShot(e)).toList();
    } catch (e) {
      throw "خطا في تنزيل الطلبات";
    }
  }

  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection("Users")
          .doc(userId)
          .collection("Orders")
          .add(order.toJson());
    } catch (e) {
      throw "خطا في حفظ الطلب";
    }
  }
}
