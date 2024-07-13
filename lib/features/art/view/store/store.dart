import 'package:art_selling_platform/common/CustomIcons/notificationIcon.dart';
import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/common/appbar/tabBar.dart';

import 'package:art_selling_platform/common/custom_shapes/Containers/artest_details.dart';
import 'package:art_selling_platform/features/art/view/store/widgets/category_tab.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:art_selling_platform/common/layout/gridLayout.dart';
import 'package:art_selling_platform/common/texts/sectionHeader.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final catagories = CatagoryController.instance.featuredCatagories;
    // final controller = Get.put(BrandController());
    return DefaultTabController(
      length: 3,
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
                              // Get.to(() => const BrandsScreen());
                            },
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                          //Grid

                          // if (controller.isLoading.value) {
                          //   return const TBrandsShimmer();
                          // }
                          // if (controller.featuredBrands.isEmpty) {
                          //   return Center(
                          //     child: Text(
                          //       "No Data Found",
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .bodyMedium!
                          //           .apply(color: Colors.white),
                          //     ),
                          //   );
                          // }
                          // return
                          TGridLayout(
                            mainAxiesExtent: 80,
                            itemCount: 2,
                            itemBuilder: (_, index) {
                              // final brand =
                              //     controller.featuredBrands[index];
                              return TArtestDetails(onTap: () {}
                                  // => Get.to(
                                  //     () => BrandProducts(brand: brand)),
                                  // brand: brand,
                                  );
                            },
                          )
                        ],
                      )),
                  bottom: const TTabBar(
                    tabs: [
                      Tab(
                        child: Text("فن تشكيلي"),
                      ),
                      Tab(
                        child: Text("رسم بالفحم"),
                      ),
                      Tab(
                        child: Text("فن تمثيلي"),
                      ),
                    ],
                  ),
                  //  TTabBar(
                  //     tabs: catagories
                  //         .map((catagory) => Tab(
                  //               child: Text(catagory.name),
                  //             ))
                  //         .toList())),
                )
              ];
            },
            body: const TabBarView(children: [
              TCatTap(),
              TCatTap(),
              TCatTap(),
            ])),
      ),
    );
  }
}