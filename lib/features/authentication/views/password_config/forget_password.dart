import 'package:art_selling_platform/features/authentication/controllers/forgot_password.dart';
import 'package:art_selling_platform/features/authentication/views/password_config/reset_password.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/validators/validiator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class ForgetpasswordScreen extends StatelessWidget {
  const ForgetpasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Text("نسيت كلمة المرور",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
                "لا تقلق سنقوم بارسال بريد الكتروني لاعادة ضبط كلمة المرور, الرجاء ادخال بريد الكترونيك",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center),
            const SizedBox(
              height: TSizes.spaceBtwSections * 2,
            ),
            //Text
            Form(
              key: controller.forgotPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: (value) => TValidiator.validiateEmail(value),
                decoration: const InputDecoration(
                    labelText: "البريد الالكتروني",
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            //Buttons
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.sendPasswordResetEmail();
                      Get.to(() => ResetpasswordScreen(
                          email: controller.email.text.trim()));
                    },
                    child: const Text("إرسال الطلب"))),
          ],
        ),
      ),
    );
  }
}
