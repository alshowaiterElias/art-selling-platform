import 'package:art_selling_platform/common/CustomIcons/notification_icon.dart';
import 'package:art_selling_platform/common/appbar/app_bar.dart';
import 'package:art_selling_platform/common/appbar/tab_bar.dart';

import 'package:art_selling_platform/common/custom_shapes/Containers/artest_details.dart';
import 'package:art_selling_platform/common/shimmer/artests_shimmer.dart';
import 'package:art_selling_platform/features/art/controllers/artest_controller.dart';
import 'package:art_selling_platform/features/art/controllers/catagory_controller.dart';
import 'package:art_selling_platform/features/art/view/artests/artest_produts.dart';
import 'package:art_selling_platform/features/art/view/artests/artests.dart';
import 'package:art_selling_platform/features/art/view/store/widgets/category_tab.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:art_selling_platform/common/layout/grid_layout.dart';
import 'package:art_selling_platform/common/texts/section_header.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catagories = CatagoryController.instance.featuredCatagories;
    final controller = ArtestController.instance;
    return DefaultTabController(
      length: catagories.length,
      child: Scaffold(
        appBar: TAppbar(
          title: Text(
            "المتجر",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartIcon(
              iconColor: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.dark,
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.dark
                        : TColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                        padding: const EdgeInsets.all(TSizes.defaultSpace),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            //Search bar
                            const SizedBox(height: TSizes.spaceBtwItems),
                            // const TSearchContainer(
                            //     text: "Search",
                            //     showBorder: true,
                            //     showBackground: false,
                            //     padding: EdgeInsets.zero),
                            // const SizedBox(height: TSizes.spaceBtwItems),

                            //Header Section
                            TSectionHeader(
                              title: "فنانون",
                              onPressd: () {
                                Get.to(() => const ArtestScreen());
                              },
                            ),
                            const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                            //Grid

                            Obx(() {
                              if (controller.isLoading.value) {
                                return const TArtestsShimmer();
                              }
                              if (controller.featuredArtests.isEmpty) {
                                return Center(
                                  child: Text(
                                    "لا يوجد اي فنانون حاليا",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(color: Colors.white),
                                  ),
                                );
                              }

                              return TGridLayout(
                                mainAxiesExtent: 80,
                                itemCount: controller.featuredArtests.length,
                                itemBuilder: (_, index) {
                                  final artest =
                                      controller.featuredArtests[index];
                                  return TArtestDetails(
                                    artest: artest,
                                    onTap: () => Get.to(
                                        () => ArtestProducts(artest: artest)),
                                  );
                                },
                              );
                            })
                          ],
                        )),
                    bottom: TTabBar(
                        tabs: catagories
                            .map((catagory) => Tab(
                                  child: Text(catagory.name),
                                ))
                            .toList())),
              ];
            },
            body: TabBarView(
              children: catagories
                  .map((category) => TCatTap(
                        category: category,
                      ))
                  .toList(),
            )),
      ),
    );
  }
}
