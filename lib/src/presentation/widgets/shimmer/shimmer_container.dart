import 'package:flutter/material.dart';

import '../../../config/theme/app_theme.dart';
import '../../../core/constants/constants.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    required this.width,
    required this.height,
    super.key,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Radiuses.small,
        ),
        color: context.colors.grey1,
      ),
    );
  }
}
