import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/common/custom_shapes/Curved_Edges/TCurvedEdgesWidget.dart';
import 'package:art_selling_platform/common/icons/favoirate_icon.dart';
import 'package:art_selling_platform/common/images/roundedImages.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';

class ArtDetailsWithImageSlider extends StatelessWidget {
  const ArtDetailsWithImageSlider({
    super.key,
    // required this.product,
  });

  // final ProductModel product;
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ImageController());
    // final images = controller.getAllProductImages(product);
    final bool isDark = THelperFunctions.isDarkMode(context);

    return CurvedEdgesWidget(
      child: Container(
        color: isDark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace * 2),
                  child: Center(
                    child:

                        // final image = controller.selectedProductImage.value;
                        GestureDetector(
                      onTap: () {}, //> controller.showEnlargedImage(image),
                      child: Image(image: AssetImage(TImageStrings.lightLogo)),
                      // CachedNetworkImage(
                      //   imageUrl: image,
                      //   progressIndicatorBuilder: (context, url, progress) =>
                      //       CircularProgressIndicator(
                      //     value: progress.progress,
                      //     color: TColors.primaryColor,
                      //   ),
                      // ),
                    ),
                  ),
                )),
            Positioned(
              bottom: 30,
              right: 0,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      // final imageSelected =
                      //     controller.selectedProductImage.value ==
                      //         images[index];
                      return TRoundedImage(
                        onPressed:
                            () {}, //=> controller.selectedProductImage.value =
                        // images[index],
                        isNetworkImage: false,
                        imgUrl: TImageStrings.lightLogo,
                        width: 80,
                        backgroundColor: isDark ? TColors.dark : TColors.white,
                        // border: Border.all(
                        //     color: imageSelected
                        //         ? TColors.primaryColor
                        //         : Colors.transparent),
                        padding: const EdgeInsets.all(TSizes.sm),
                      );
                    },
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        width: TSizes.spaceBtwItems,
                      );
                    },
                    itemCount: 3 //images.length,
                    ),
              ),
            ),
            TAppbar(
              showBackArrow: true,
              actions: [
                TFavoriateIcon(
                  productId: "product.id",
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
