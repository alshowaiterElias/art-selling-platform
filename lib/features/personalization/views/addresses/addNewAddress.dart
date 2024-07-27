import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/features/personalization/controllers/address_controller.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/validators/validiator.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.intance;
    return Scaffold(
      appBar: const TAppbar(showBackArrow: true, title: Text("اضف عنوان جديد")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) =>
                      TValidiator.validateEmptyText("الاسم", value),
                  controller: controller.name,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: "الاسم"),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  validator: (value) =>
                      TValidiator.validateEmptyText("رقم الهاتف", value),
                  controller: controller.phoneNumber,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: "رقم الهاتف"),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) =>
                            TValidiator.validateEmptyText("الشارع", value),
                        controller: controller.street,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building_31),
                            labelText: "الشارع"),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        validator: (value) =>
                            TValidiator.validateEmptyText("الحارة", value),
                        controller: controller.neighborhood,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.code),
                            labelText: "الحارة"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                    validator: (value) =>
                        TValidiator.validateEmptyText("المدينة", value),
                    controller: controller.city,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.building),
                        labelText: "المدينة")),
                const SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.addNewAddress();
                      },
                      child: const Text("حفظ")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
