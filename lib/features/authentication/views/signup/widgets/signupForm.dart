import 'package:art_selling_platform/features/authentication/views/signup/verfiy_Email.dart';
import 'package:art_selling_platform/utils/validators/validiator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final SignupController controller = Get.put(SignupController());
    final bool isDark = THelperFunctions.isDarkMode(context);
    return Form(
        // key: controller.signupFormKey,
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                validator: (value) =>
                    TValidiator.validateEmptyText("الاسم الاول", value),
                // controller: controller.firstname,
                expands: false,
                decoration: const InputDecoration(
                  labelText: "الاسم الاول",
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                validator: (value) =>
                    TValidiator.validateEmptyText("اللقب", value),
                // controller: controller.lastname,
                expands: false,
                decoration: const InputDecoration(
                  labelText: "اللقب",
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        TextFormField(
          validator: (value) =>
              TValidiator.validateEmptyText("اسم المستخدم", value),
          // controller: controller.username,
          expands: false,
          decoration: const InputDecoration(
              labelText: "اسم المستخدم", prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        TextFormField(
          validator: (value) => TValidiator.validiateEmail(value),
          // controller: controller.email,
          expands: false,
          decoration: const InputDecoration(
            labelText: "البريد الالكتروني",
            prefixIcon: Icon(Iconsax.direct),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        TextFormField(
          validator: (value) => TValidiator.validatePassword(value),
          // controller: controller.password,
          expands: false,
          // obscureText: controller.hidePassword.value,
          decoration: InputDecoration(
            labelText: "كلمة المرور",
            prefixIcon: const Icon(Iconsax.password_check),
            suffixIcon: IconButton(
              onPressed: () {
                // controller.hidePassword.value =
                //     !controller.hidePassword.value;
              },
              icon: Icon(Iconsax.eye),
            ),
          ),
        ),

        const SizedBox(height: TSizes.spaceBtwInputFields),
        TextFormField(
          validator: (value) => TValidiator.validatePhoneNumber(value),
          // controller: controller.phoneNumber,
          expands: false,
          decoration: const InputDecoration(
            labelText: "رقم الهاتف",
            prefixIcon: Icon(Iconsax.call),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        const SizedBox(height: TSizes.spaceBtwSections),
        //Terms and Privacy
        Row(
          children: [
            SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                    value: true, //controller.tickCheckBox.value,
                    onChanged: (value) {
                      // controller.tickCheckBox.value =
                      //     !controller.tickCheckBox.value;
                    })),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'اوافق على  ',
                  style: Theme.of(context).textTheme.labelMedium),
              TextSpan(
                  text: 'سياسات الخصوصية و الامان ',
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                        color: isDark ? TColors.white : TColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            isDark ? TColors.white : TColors.primaryColor,
                      )),
              TextSpan(
                  text: 'و', style: Theme.of(context).textTheme.labelMedium),
              TextSpan(
                  text: 'شروط الاستخدام',
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                        color: isDark ? TColors.white : TColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            isDark ? TColors.white : TColors.primaryColor,
                      )),
            ]))
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // controller.signUp();
              Get.to(() => const VerfiyEmailScreen());
            },
            child: const Text("إنشاء حسابي"),
          ),
        )
      ],
    ));
  }
}
