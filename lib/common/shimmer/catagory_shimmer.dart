import 'package:art_selling_platform/common/shimmer/shimmer_effect.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCatagoryShimmer extends StatelessWidget {
  const TCatagoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TShimmerEffect(
                  width: 55,
                  height: 55,
                  radius: 55,
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                TShimmerEffect(width: 55, height: 8)
              ],
            );
          },
          separatorBuilder: (context, index) =>
              const SizedBox(width: TSizes.spaceBtwItems),
          itemCount: itemCount),
    );
  }
}
