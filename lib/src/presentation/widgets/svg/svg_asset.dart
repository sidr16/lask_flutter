import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgAsset extends StatelessWidget {
  const SvgAsset(
    this.assetName, {
    super.key,
    this.color,
    this.size,
  });

  final String assetName;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      width: size,
      height: size,
    );
  }
}
