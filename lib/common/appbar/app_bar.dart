import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/device/device_utility.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TAppbar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(
          left: TSizes.lg, right: TSizes.lg, top: TSizes.sm),
      child: AppBar(
        automaticallyImplyLeading: showBackArrow,
        leading: showBackArrow
            ? IconButton(
                icon: Icon(
                  Iconsax.arrow_left,
                  color: isDark ? TColors.white : TColors.dark,
                ),
                onPressed: () {
                  Get.back();
                },
              )
            : leadingIcon != null
                ? IconButton(
                    icon: Icon(leadingIcon),
                    onPressed: () {
                      leadingOnPressed;
                    },
                  )
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppbarHeight());
}