import 'package:flutter/material.dart';

import '../../../core/config/assets/svg_icons.dart';
import '../../../core/config/constants/constants.dart';
import '../../../core/config/theme/app_theme.dart';
import '../svg/svg_asset.dart';

class AppNavigationBarButton extends StatelessWidget {
  const AppNavigationBarButton({
    required this.name,
    required this.icon,
    this.isActive = false,
    super.key,
  });

  final String name;
  final SvgIcon icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final color = isActive
        ? context.colors.backgroundPrimary
        : context.colors.textPrimary;

    return AnimatedContainer(
      duration: Durations.medium3,
      decoration: BoxDecoration(
        color: isActive ? context.colors.textPrimary : null,
        borderRadius: BorderRadius.circular(BorderRadiuses.full),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Paddings.small,
        horizontal: Paddings.medium,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgAsset(
            icon.path,
            color: color,
          ),
          AnimatedSize(
            curve: Curves.ease,
            duration: Durations.medium1,
            child: isActive
                ? Row(
                    children: [
                      Gaps.small,
                      Text(
                        name,
                        style: context.textStyles.body2Semibold,
                      ),
                    ],
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
