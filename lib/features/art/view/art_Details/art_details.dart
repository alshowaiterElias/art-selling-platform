import 'package:art_selling_platform/common/texts/sectionHeader.dart';
import 'package:art_selling_platform/features/art/view/art_Details/widgets/bottomNavAddToCart.dart';
import 'package:art_selling_platform/features/art/view/art_Details/widgets/art_details_with_image_slider.dart';
import 'package:art_selling_platform/features/art/view/art_Details/widgets/art_meta_data.dart';
import 'package:art_selling_platform/features/art/view/art_Details/widgets/ratingAndShare.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class ArtDetailsScreen extends StatelessWidget {
  const ArtDetailsScreen({
    super.key,
    // required this.product,
  });

  // final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddtoCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ArtDetailsWithImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace,
                  left: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //ratings and share
                  const TRatingAndShare(),
                  //price title available type
                  ArtMetaData(),

                  //attribuites
                  // if (product.productType == ProductType.variable.toString())
                  // ArtAttribute(),

                  // if (product.productType == ProductType.variable.toString())
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("اذهب للحساب")),
                  ),
                  //description
                  const SizedBox(height: TSizes.spaceBtwSections),

                  const TSectionHeader(title: "الوصف", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // ReadMoreText(
                  //   "dajmdsk",
                  //   trimLines: 2,
                  //   trimCollapsedText: " Show more",
                  //   trimExpandedText: " Less ",
                  //   moreStyle:
                  //       TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  //   lessStyle:
                  //       TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  // ),

                  //reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeader(
                        title: "تقييم (199)",
                        onPressd: () {},
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () {
                            // Get.to(() => const PitchReviews());
                          },
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}