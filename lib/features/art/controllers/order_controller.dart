import 'package:art_selling_platform/data/repos/authentication.dart';
import 'package:art_selling_platform/data/repos/order.dart';
import 'package:art_selling_platform/features/art/controllers/cart_controller.dart';
import 'package:art_selling_platform/features/art/controllers/checkout_controller.dart';
import 'package:art_selling_platform/features/art/models/order_model.dart';
import 'package:art_selling_platform/features/authentication/views/signup/widgets/success_screen.dart';
import 'package:art_selling_platform/features/personalization/controllers/address_controller.dart';
import 'package:art_selling_platform/nav.dart';
import 'package:art_selling_platform/utils/constants/enums.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:art_selling_platform/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.intance;
  final checkoutController = CheckoutController.instance;
  final orderRepo = Get.put(OrderRepo());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepo.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
      return [];
    }
  }

  void processOrder(int totalPrice) async {
    try {
      FullScreenLoader.openLoadingDialog(
          "جاري تسجيل طلبك", TImageStrings.docerAnimation);

      final userId = AuthenticationRepo.instance.authUser!.uid;
      if (userId.isEmpty) return;

      final order = OrderModel(
          id: UniqueKey().toString(),
          status: OrderStatus.pending,
          totalAmount: totalPrice.toDouble(),
          orderDate: DateTime.now(),
          deliveryDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPayment.value.name,
          userId: userId,
          address: addressController.selectedAddress.value,
          items: cartController.cartItems.toList());

      await orderRepo.saveOrder(order, userId);

      cartController.clearCart();

      Get.off(() => Successscreen(
          image: TImageStrings.onBoaringImage1,
          title: "تمت العملية بنجاح",
          subtitle: "سيتم ايصال طلبك قريبا",
          onPressed: () {
            Get.offAll(() => const NavigationMenu());
          }));
    } catch (e) {
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
    }
  }
}
