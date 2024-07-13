import 'package:art_selling_platform/common/images/roundedImages.dart';
import 'package:art_selling_platform/common/texts/art_title.dart';
import 'package:art_selling_platform/common/texts/art_title_with_icon.dart';
import 'package:art_selling_platform/utils/constants/colors.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    // required this.cartItem,
  });

  // final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          isNetworkImage: false,
          imgUrl: TImageStrings.lightLogo, //cartItem.image ?? "",
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TArtTitleWithIcon(title: "MSA"),
              TArtTitle(title: "any", maxLines: 1),
              Text.rich(TextSpan())
            ],
          ),
        )
      ],
    );
  }
}
