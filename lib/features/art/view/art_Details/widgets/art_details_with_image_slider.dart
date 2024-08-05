import 'package:art_selling_platform/common/appbar/app_bar.dart';
import 'package:art_selling_platform/common/custom_shapes/Curved_Edges/t_curved_edges_widget.dart';
import 'package:art_selling_platform/common/icons/favoirate_icon.dart';
import 'package:art_selling_platform/features/art/controllers/image_controller.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:get/get.dart';

class ArtDetailsWithImageSlider extends StatelessWidget {
  const ArtDetailsWithImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
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
                    child: GestureDetector(
                      onTap: () {
                        controller.showEnlargedImage(product.thumbNail);
                      },
                      child: CachedNetworkImage(
                        imageUrl: product.thumbNail,
                        progressIndicatorBuilder: (context, url, progress) =>
                            CircularProgressIndicator(
                          value: progress.progress,
                          color: TColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                )),
            TAppbar(
              showBackArrow: true,
              actions: [
                TFavoriateIcon(
                  productId: product.id,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
