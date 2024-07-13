import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/features/personalization/views/addresses/addNewAddress.dart';
import 'package:art_selling_platform/features/personalization/views/addresses/widgets/signleAddress.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(AddressController());
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
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return TSingleAddress(
                  // address: addresses[index],
                  onTap: () {},
                );
              },
            )),
      ),
    );
  }
}
