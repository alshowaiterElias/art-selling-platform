import 'package:art_selling_platform/common/login_signup/dividerForm.dart';
import 'package:art_selling_platform/common/login_signup/socialMedia.dart';
import 'package:art_selling_platform/features/authentication/views/signup/widgets/signupForm.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //title
              Text("إنشاء حساب",
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Form
              const SignupForm(),

              //Footer
              const SizedBox(height: TSizes.spaceBtwSections),
              const TFormDivider(dividerText: "أو قم بالتسجيل عن طريق"),
              const SizedBox(height: TSizes.spaceBtwItems),

              const SocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
