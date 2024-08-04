import 'package:art_selling_platform/features/art/controllers/artest_controller.dart';
import 'package:art_selling_platform/features/art/controllers/checkout_controller.dart';
import 'package:art_selling_platform/features/personalization/controllers/address_controller.dart';
import 'package:art_selling_platform/utils/network/networkManager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(AddressController());
    Get.put(CheckoutController());
    Get.put(ArtestController());
  }
}
