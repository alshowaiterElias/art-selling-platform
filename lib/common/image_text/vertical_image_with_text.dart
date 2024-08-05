import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../images/circular_images.dart';

class TVerticalImageWithText extends StatelessWidget {
  const TVerticalImageWithText({
    super.key,
    required this.image,
    required this.text,
    this.backgroundColor,
    this.textColor = TColors.white,
    this.isNetworkImage = false,
    this.onTap,
  });

  final String image, text;
  final Color? backgroundColor;
  final Color textColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TCircularImage(
              padding: TSizes.sm,
              boxFit: BoxFit.cover,
              clipImage: false,
              image: image,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 3,
            ),
            SizedBox(
              width: 65,
              child: Center(
                child: Text(
                  textDirection: TextDirection.rtl,
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
