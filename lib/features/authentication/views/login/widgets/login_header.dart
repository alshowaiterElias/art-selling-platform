import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          height: 150,
          image: AssetImage(
              isDark ? TImageStrings.lightLogo : TImageStrings.lightLogo),
        ),
        Text(
          "منصة فن",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        Text(
          "مرحبا بك, قم بتسجيل الدخول او إنشاء حساب",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
