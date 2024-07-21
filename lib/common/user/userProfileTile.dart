import 'package:art_selling_platform/common/images/circularImages.dart';
import 'package:art_selling_platform/features/personalization/controllers/user_controller.dart';
import 'package:art_selling_platform/features/personalization/views/profile/profile.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const TCircularImage(
        image: TImageStrings.lightLogo,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
          onPressed: () {
            Get.to(() => const ProfileScreen());
          },
          icon: const Icon(
            Iconsax.edit,
            color: TColors.white,
          )),
    );
  }
}
