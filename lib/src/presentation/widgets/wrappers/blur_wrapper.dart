import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../config/theme/app_theme.dart';

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
    final sigma = Platform.isIOS ? 5.0 : 0.0;

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: sigma,
        sigmaY: sigma,
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
