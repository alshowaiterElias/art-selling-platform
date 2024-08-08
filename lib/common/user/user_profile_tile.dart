import 'package:art_selling_platform/common/images/circular_images.dart';
import 'package:art_selling_platform/features/personalization/controllers/user_controller.dart';
import 'package:art_selling_platform/features/personalization/views/profile/profile.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
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
      leading: Obx(
        () => TCircularImage(
          image: controller.user.value.profilePicture,
          isNetworkImage: true,
          width: 50,
          height: 50,
          padding: 0,
        ),
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