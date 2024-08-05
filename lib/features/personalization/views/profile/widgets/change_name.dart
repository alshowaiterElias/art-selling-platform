import 'package:art_selling_platform/common/appbar/app_bar.dart';
import 'package:art_selling_platform/features/personalization/controllers/update_name_controller.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/validators/validiator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          "تغيير الاسم",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "استخدم اسمك الحقيقي كونه اسهل للتحقق و كذلك يظهر في عدة صفحات في البرنامج",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Form(
                  key: controller.updateUserNameKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.firstname,
                        validator: (value) =>
                            TValidiator.validateEmptyText("الاسم الاول", value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: "الاسم الاول",
                            prefix: Icon(Iconsax.user)),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        controller: controller.lastname,
                        validator: (value) =>
                            TValidiator.validateEmptyText("اللقب", value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: "اللقب", prefix: Icon(Iconsax.user)),
                      ),
                    ],
                  )),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.updateUserName();
                    },
                    child: const Text("حفظ")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
