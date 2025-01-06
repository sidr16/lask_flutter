import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/config/theme/app_theme.dart';

class PrimaryShimmer extends StatelessWidget {
  const PrimaryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colors.grey1,
      highlightColor: context.colors.backgroundPrimary,
      child: Container(
        color: context.colors.backgroundPrimary,
      ),
    );
  }
}
