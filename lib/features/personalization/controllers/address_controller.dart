import 'package:art_selling_platform/common/texts/section_header.dart';
import 'package:art_selling_platform/data/repos/address.dart';
import 'package:art_selling_platform/features/personalization/models/address_model.dart';
import 'package:art_selling_platform/features/personalization/views/addresses/addresses.dart';
import 'package:art_selling_platform/features/personalization/views/addresses/widgets/signle_address.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/cloud_helper_function.dart';
import 'package:art_selling_platform/utils/loaders/loaders.dart';
import 'package:art_selling_platform/utils/network/network_manager.dart';
import 'package:art_selling_platform/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get intance => Get.find();
  final addressRepo = Get.put(AddressRepo());
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final city = TextEditingController();
  final neighborhood = TextEditingController();
  final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;

  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepo.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere((e) => e.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
          title: "",
          onWillPop: () async {
            return false;
          },
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: const CircularProgressIndicator());

      //clear selected address
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepo.updateSelectedField(selectedAddress.value.id, false);
      }

      //assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      await addressRepo.updateSelectedField(selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
    }
  }

  Future addNewAddress() async {
    try {
      FullScreenLoader.openLoadingDialog(
          "حفظ العنوان", TImageStrings.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      if (!addressFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      final address = AddressModel(
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          neighborhood: neighborhood.text.trim(),
          selectedAddress: true,
          id: "");
      final id = await addressRepo.addNewAddress(address);

      address.id = id;
      await selectAddress(address);

      FullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: "تم اضافة العنوان");

      refreshData.toggle();

      resetFormFields();

      Navigator.of(Get.context!).pop();
    } catch (e) {
      TLoaders.errorSnackBar(title: "يا ساتر", message: e.toString());
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    neighborhood.clear();
    city.clear();
    addressFormKey.currentState?.reset();
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeader(title: "إختر العنوان"),
              FutureBuilder(
                future: getAllUserAddresses(),
                builder: (context, snapshot) {
                  final respone = TCloudHelperFunction.checkMultiRecordState(
                      snapshot: snapshot);
                  if (respone != null) return respone;

                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return TSingleAddress(
                        address: snapshot.data![index],
                        onTap: () async {
                          await selectAddress(snapshot.data![index]);
                          Get.back();
                        },
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const AddressesScreen()),
                    child: const Text("أضف عنوان جديد")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
