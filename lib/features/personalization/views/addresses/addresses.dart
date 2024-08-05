import 'package:art_selling_platform/common/appbar/app_bar.dart';
import 'package:art_selling_platform/features/personalization/controllers/address_controller.dart';
import 'package:art_selling_platform/features/personalization/views/addresses/add_new_address.dart';
import 'package:art_selling_platform/features/personalization/views/addresses/widgets/signle_address.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddNewAddress());
        },
        backgroundColor: TColors.primaryColor,
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: TAppbar(
        title: Text(
          "العناوين",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Obx(
              () => FutureBuilder(
                  key: Key(controller.refreshData.value.toString()),
                  future: controller.getAllUserAddresses(),
                  builder: (context, snapshot) {
                    final widget = TCloudHelperFunction.checkMultiRecordState(
                        snapshot: snapshot);
                    if (widget != null) return widget;

                    final addresses = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      itemBuilder: (context, index) {
                        return TSingleAddress(
                          address: addresses[index],
                          onTap: () {
                            controller.selectAddress(addresses[index]);
                          },
                        );
                      },
                    );
                  }),
            )),
      ),
    );
  }
}
