import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/common/custom_shapes/Containers/primaryHeaderContainer.dart';
import 'package:art_selling_platform/common/user/settingMenu.dart';
import 'package:art_selling_platform/common/user/userProfileTile.dart';
import 'package:art_selling_platform/features/art/view/orders/orders.dart';
import 'package:art_selling_platform/features/personalization/views/addresses/addresses.dart';
import 'package:flutter/material.dart';

import 'package:art_selling_platform/common/texts/sectionHeader.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppbar(
                  title: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "حسابي",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                ),
                const TUserProfileTile(),
                const SizedBox(height: TSizes.spaceBtwSections)
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeader(
                      title: "اعدادات الحساب", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingMenuTile(
                      title: "عناويني",
                      subTitle: "ضع عنوان التوصيل",
                      icon: Iconsax.safe_home,
                      onTap: () {
                        Get.to(() => const AddressesScreen());
                      }),
                  TSettingMenuTile(
                      title: "طلباتي",
                      subTitle: "الطلبات المكتملة و قيد التنفيذ",
                      icon: Iconsax.bag_tick,
                      onTap: () {
                        Get.to(() => const OrdersScreen());
                      }),
                  TSettingMenuTile(
                      title: "التنبيهات",
                      subTitle: "ضبط التنبيهات",
                      icon: Iconsax.notification,
                      onTap: () {}),
                  TSettingMenuTile(
                      title: "سياسات خصوصية الحساب",
                      subTitle: "تحكم ببياناتك والذي تراه بهذا التطبيق",
                      icon: Iconsax.security_card,
                      onTap: () {}),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeader(
                      title: "اعدادات البرنامج", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingMenuTile(
                    title: "رفع بيانات",
                    subTitle: " رفع بيانات خاصة بي الى البرنامج",
                    icon: Iconsax.document_upload,
                    onTap: () {
                      // Get.to(() => const UploadScreen());
                    },
                  ),
                  TSettingMenuTile(
                    title: "HD صور",
                    subTitle: "هل تريد ان تكون الصور بدقة عالية",
                    icon: Iconsax.image,
                    trailing: Switch(value: false, onChanged: (value) {}),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          // AuthenticationRepo.instance.logout();
                        },
                        child: const Text("تسجيل الخروج")),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2.5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
