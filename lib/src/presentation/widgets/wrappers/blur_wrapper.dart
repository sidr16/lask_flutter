import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/config/theme/app_theme.dart';

class BlurWrapper extends StatelessWidget {
  const BlurWrapper({
    required this.child,
    this.enabled = true,
    super.key,
  });

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5,
        sigmaY: 5,
      ),
      enabled: enabled,
      child: AnimatedContainer(
        color: context.colors.grey1.withValues(
          alpha: enabled ? 0.6 : 0,
        ),
        duration: Durations.medium2,
        child: child,
      ),
    );
  }
}
