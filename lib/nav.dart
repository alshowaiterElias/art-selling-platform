import 'package:art_selling_platform/features/art/view/home/home.dart';
import 'package:art_selling_platform/features/art/view/store/store.dart';
import 'package:art_selling_platform/features/art/view/wishList/wish_list.dart';
import 'package:art_selling_platform/features/personalization/views/settings/settings.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/art/view/commission/commission.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final bool isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: isDark ? TColors.balck : TColors.white,
          indicatorColor: isDark
              ? TColors.white.withOpacity(0.1)
              : TColors.balck.withOpacity(0.1),
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "الرئيسية"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "المتجر"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "المفضلة"),
            NavigationDestination(
                icon: Icon(Iconsax.command), label: "طلب خاص"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "المستخدم"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const WishlistScreen(),
    const CommissionScreen(),
    const SettingsScreen(),
  ];
}
