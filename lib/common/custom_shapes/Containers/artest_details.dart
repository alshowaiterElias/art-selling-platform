import 'package:art_selling_platform/common/custom_shapes/Containers/circular_container.dart';
import 'package:art_selling_platform/common/images/circular_images.dart';
import 'package:art_selling_platform/common/texts/art_title_with_icon.dart';
import 'package:art_selling_platform/features/art/models/artest_model.dart';
import 'package:art_selling_platform/utils/constants/enums.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TArtestDetails extends StatelessWidget {
  const TArtestDetails({
    super.key,
    this.onTap,
    this.showBorder = true,
    required this.artest,
    this.showChat,
  });

  final ArtestModel artest;
  final void Function()? onTap;
  final bool showBorder;
  final bool? showChat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TCircularContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        backgroundColor: Colors.transparent,
        showBorder: showBorder,
        child: Row(
          children: [
            Flexible(
              child: TCircularImage(
                isNetworkImage: true,
                image: artest.image,
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TArtTitleWithIcon(
                    title: artest.name,
                    textSizes: TextSizes.large,
                  ),
                  Text(
                    artest.phoneNumber,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ),
            if (showChat == true)
              const Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Iconsax.message),
                    Text("إبدا المحادثة مع"),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
