import 'package:art_selling_platform/data/repos/authentication.dart';
import 'package:art_selling_platform/features/personalization/models/address_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddressRepo extends GetxController {
  static AddressRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepo.instance.authUser!.uid;
      if (userId.isEmpty) throw "المعلومات غير موجودة لهذا المستخدم";
      final result = await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .get();
      return result.docs
          .map((e) => AddressModel.fromDocumentSnapshot(e))
          .toList();
    } catch (e) {
      throw "خطا في تنزيل عنوان المستخدم";
    }
  }

  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepo.instance.authUser!.uid;
      await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .doc(addressId)
          .update({"SelectedAddress": selected});
    } catch (e) {
      throw "خطا في اختيار العنوان";
    }
  }

  Future<String> addNewAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepo.instance.authUser!.uid;
      final currentAddress = await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw "خطا في اضافة عنوان جديد";
    }
  }
}
