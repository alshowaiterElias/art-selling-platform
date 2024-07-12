import 'package:art_selling_platform/common/styles/spacing_styles.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Successscreen extends StatelessWidget {
  const Successscreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppbarHeight * 2,
          child: Column(
            children: [
              Lottie.asset(TImageStrings.emailConfirmed,
                  width: THelperFunctions.screenWidth(context) * 0.6),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Title SubTitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(subtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed, child: const Text("المواصلة")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
