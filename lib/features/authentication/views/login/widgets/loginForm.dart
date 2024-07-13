import 'package:art_selling_platform/features/art/view/home/home.dart';
import 'package:art_selling_platform/features/authentication/views/password_config/forgetPassword.dart';
import 'package:art_selling_platform/features/authentication/views/signup/signup.dart';
import 'package:art_selling_platform/utils/validators/validiator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final LoginController controller = Get.put(LoginController());
    return Form(
      // key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
                validator: (value) => TValidiator.validiateEmail(value),
                // controller: controller.email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: "البريد الالكتروني",
                )),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(

                // obscureText: controller.hidePassword.value,
                validator: (value) =>
                    TValidiator.validateEmptyText("كلمة المرور", value),
                // controller: controller.password,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: "كلمة المرور",
                    suffixIcon: IconButton(
                        onPressed: () {
                          // controller.hidePassword.value =
                          //     !controller.hidePassword.value;
                        },
                        icon: Icon(Iconsax.eye)))),

            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2,
            ),
            // Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //remember me
                Row(
                  children: [
                    Checkbox(
                        value: true, //controller.rememberMe.value,
                        onChanged: (value) {
                          // controller.rememberMe.value =
                          //     !controller.rememberMe.value;
                        }),
                    const Text("تذكرني"),
                  ],
                ),
                //forgot password
                TextButton(
                  onPressed: () {
                    Get.to(() => const ForgetpasswordScreen());
                  },
                  child: const Text("نسيت كلمة المرور"),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            //Sign in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    // controller.emailAndPasswordSignIn();
                    Get.to(() => const HomeScreen());
                  },
                  child: const Text("تسجيل الدخول")),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            //Create an account
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const SignUpScreen());
                  },
                  child: const Text("إنشاء حساب")),
            ),
          ],
        ),
      ),
    );
  }
}
