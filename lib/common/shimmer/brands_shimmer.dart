import 'package:art_selling_platform/common/layout/gridLayout.dart';
import 'package:art_selling_platform/common/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxiesExtent: 80,
      itemCount: itemCount,
      itemBuilder: (p0, p1) => const TShimmerEffect(width: 300, height: 80),
    );
  }
}
