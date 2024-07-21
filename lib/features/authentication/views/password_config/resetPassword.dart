import 'package:art_selling_platform/features/authentication/controllers/forgot_password.dart';
import 'package:art_selling_platform/features/authentication/views/login/login.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResetpasswordScreen extends StatelessWidget {
  const ResetpasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Lottie.asset(TImageStrings.passwordLinkSent,
                  width: THelperFunctions.screenWidth(context) * 0.6),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //email
              Text(
                email,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //Title SubTitle
              Text(
                "تم إرسال بريد الكتروني الى حسابك",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                  "قم بالذهاب الى بريد الكترونيك حتى تتمكن من اعادة ضبط كلمة المرور",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(() => const LoginScreen());
                    },
                    child: const Text("تم")),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      ForgotPasswordController.instance
                          .resendPasswordResetEmail(email);
                    },
                    child: const Text("إعادة ارسال البريد الالكتروني")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
