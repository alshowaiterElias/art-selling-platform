import 'package:art_selling_platform/common/appbar/app_bar.dart';
import 'package:art_selling_platform/features/personalization/controllers/user_controller.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/validators/validiator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class ReAuthenticateUser extends StatelessWidget {
  const ReAuthenticateUser({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppbar(
        title: Text("أعد تاكيد المتسخدم"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
              key: controller.deleteUserFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.verfiyEmail,
                    validator: (value) => TValidiator.validiateEmail(value),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.arrow_right),
                      labelText: "البريد الالكتروني",
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verfiyPassword,
                      validator: (value) => TValidiator.validatePassword(value),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.hidePassword.value =
                                  !controller.hidePassword.value;
                            },
                            icon: Icon(controller.hidePassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye)),
                        labelText: "كلمة المرور",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          controller.reAuthenticateEmailAndPassowrdThenDelete();
                        },
                        child: const Text("تاكيد")),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
