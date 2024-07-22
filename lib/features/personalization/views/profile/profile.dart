import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/common/images/circularImages.dart';
import 'package:art_selling_platform/common/shimmer/shimmer_effect.dart';
import 'package:art_selling_platform/common/texts/sectionHeader.dart';
import 'package:art_selling_platform/features/personalization/controllers/user_controller.dart';
import 'package:art_selling_platform/features/personalization/views/profile/widgets/change_name.dart';
import 'package:art_selling_platform/features/personalization/views/profile/widgets/profileMenu.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          "الصفحة الشخصية",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: TColors.dark),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : TImageStrings.lightLogo;
                      return controller.imageLoading.value
                          ? const TShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : TCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: true,
                            );
                    }),
                    TextButton(
                        onPressed: () {
                          controller.uploadProfilePicture();
                        },
                        child: const Text("تغيير الصورة")),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeader(
                  title: "معلومات حسابي", showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenuItem(
                title: "الاسم",
                value: controller.user.value.fullName,
                onPressed: () {
                  Get.to(() => const ChangeNameScreen());
                },
              ),
              TProfileMenuItem(
                title: "إسم المستخدم",
                value: controller.user.value.username,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeader(
                title: "المعلومات الشخصية",
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenuItem(
                title: "ID",
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              TProfileMenuItem(
                title: "البريد الالكتروني",
                value: controller.user.value.email,
                onPressed: () {},
              ),
              TProfileMenuItem(
                title: "رقم الهاتف",
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  child: const Text(
                    "حذف حسابي",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    controller.deleteUserWarningPopUp();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
