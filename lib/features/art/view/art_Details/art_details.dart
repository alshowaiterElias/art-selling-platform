import 'package:art_selling_platform/common/texts/section_header.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:art_selling_platform/features/art/view/art_Details/widgets/bottom_nav_add_to_cart.dart';
import 'package:art_selling_platform/features/art/view/art_Details/widgets/art_details_with_image_slider.dart';
import 'package:art_selling_platform/features/art/view/art_Details/widgets/art_meta_data.dart';
import 'package:art_selling_platform/features/art/view/art_Details/widgets/rating_and_share.dart';
import 'package:art_selling_platform/features/art/view/art_reviews/art_reviews.dart';
import 'package:art_selling_platform/features/art/view/checkout/checkout.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ArtDetailsScreen extends StatelessWidget {
  const ArtDetailsScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddtoCart(
        product: product,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ArtDetailsWithImageSlider(
              product: product,
            ),
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
                  ArtMetaData(
                    product: product,
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  //checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const CheckOutScreen());
                        },
                        child: const Text("اذهب للحساب")),
                  ),
                  //description
                  const SizedBox(height: TSizes.spaceBtwSections),

                  const TSectionHeader(
                    title: "الوصف",
                    showActionButton: true,
                    buttonTitle: "",
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? "",
                    trimLines: 2,
                    trimCollapsedText: "عرض المزيد",
                    trimExpandedText: " عرض أقل ",
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  //reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(() => const ArtReviewsScreen());
                          },
                          icon: const Icon(
                            Iconsax.arrow_left,
                            size: 18,
                          )),
                      TSectionHeader(
                        title: "تقييم (199)",
                        onPressd: () {},
                        showActionButton: false,
                      ),
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
