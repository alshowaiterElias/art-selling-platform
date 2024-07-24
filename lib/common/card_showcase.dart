import 'package:art_selling_platform/common/custom_shapes/Containers/circularContainer.dart';
import 'package:art_selling_platform/common/custom_shapes/Containers/artest_details.dart';
import 'package:art_selling_platform/common/shimmer/shimmer_effect.dart';
import 'package:art_selling_platform/features/art/models/artest_model.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TCardShowCase extends StatelessWidget {
  const TCardShowCase({
    super.key,
    required this.images,
    required this.artest,
  });
  final ArtestModel artest;
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TCircularContainer(
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          TArtestDetails(
            artest: artest,
            showBorder: false,
          ),
          Row(
            children:
                images.map((img) => cardImageDetails(img, context)).toList(),
          )
        ],
      ),
    );
  }
}

Widget cardImageDetails(String image, context) {
  return Expanded(
      child: TCircularContainer(
          height: 100,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.white,
          margin: const EdgeInsets.only(right: TSizes.sm),
          padding: const EdgeInsets.all(TSizes.sm),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, progress) =>
                const TShimmerEffect(width: 100, height: 100),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )));
}
