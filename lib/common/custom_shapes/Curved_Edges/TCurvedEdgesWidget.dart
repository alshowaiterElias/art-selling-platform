import 'package:art_selling_platform/common/custom_shapes/Curved_Edges/TCustomeCurvedEdge.dart';
import 'package:flutter/material.dart';

class CurvedEdgesWidget extends StatelessWidget {
  const CurvedEdgesWidget({
    super.key,
    this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCustomeCurvedEdge(), child: child);
  }
}
