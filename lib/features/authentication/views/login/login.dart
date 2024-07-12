import 'package:art_selling_platform/common/login_signup/dividerForm.dart';
import 'package:art_selling_platform/common/login_signup/socialMedia.dart';
import 'package:art_selling_platform/common/styles/spacing_styles.dart';
import 'package:art_selling_platform/features/authentication/views/login/widgets/loginForm.dart';
import 'package:art_selling_platform/features/authentication/views/login/widgets/loginHeader.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppbarHeight,
          child: Column(
            children: [
              //logo ,Title,SubTitle
              const SignInHeader(),

              //Form
              const SignInForm(),

              //Divider
              TFormDivider(
                dividerText: "أو قم بالتسحيل عن طريق",
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Footer
              const SocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
