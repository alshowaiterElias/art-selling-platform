import 'package:art_selling_platform/common/CustomIcons/notificationIcon.dart';
import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/common/shimmer/shimmer_effect.dart';
import 'package:art_selling_platform/features/personalization/controllers/user_controller.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeAppbar extends StatelessWidget {
  const THomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("مرحبا",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(color: TColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              return const TShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white));
            }
          }),
        ],
      ),
      actions: const [
        TCartIcon(
          iconColor: TColors.white,
        )
      ],
    );
  }
}
