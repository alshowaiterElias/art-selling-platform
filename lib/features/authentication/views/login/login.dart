import 'package:art_selling_platform/common/login_signup/divider_form.dart';
import 'package:art_selling_platform/common/login_signup/social_media.dart';
import 'package:art_selling_platform/common/styles/spacing_styles.dart';
import 'package:art_selling_platform/features/authentication/views/login/widgets/login_form.dart';
import 'package:art_selling_platform/features/authentication/views/login/widgets/login_header.dart';
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
              SignInHeader(),

              //Form
              SignInForm(),

              //Divider
              TFormDivider(
                dividerText: "أو قم بالتسحيل عن طريق",
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Footer
              SocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
