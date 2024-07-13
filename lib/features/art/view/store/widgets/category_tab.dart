import 'package:art_selling_platform/common/card_showcase.dart';
import 'package:art_selling_platform/common/cards/card_vertical.dart';
import 'package:art_selling_platform/common/layout/gridLayout.dart';
import 'package:art_selling_platform/common/texts/sectionHeader.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCatTap extends StatelessWidget {
  const TCatTap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const TCardShowCase(
                  images: [
                    TImageStrings.lightLogo,
                  ],
                ),
                const TSectionHeader(title: "قد يعجبك"),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                TGridLayout(
                  itemCount: 4,
                  itemBuilder: (p0, p1) => const TCardVertical(),
                )
              ],
            ),
          ),
        ]);
  }
}
