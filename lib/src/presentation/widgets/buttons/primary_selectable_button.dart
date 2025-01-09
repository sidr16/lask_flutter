import 'package:flutter/material.dart';

import '../../../core/config/theme/app_theme.dart';

class PrimarySelectableButton extends StatelessWidget {
  const PrimarySelectableButton({
    required this.title,
    required this.onPressed,
    this.isSelected = false,
    super.key,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        overlayColor: context.colors.brandBlue,
        backgroundColor: isSelected
            ? context.colors.brandBlue10
            : context.colors.backgroundPrimary,
        side: BorderSide(
          color: context.colors.brandBlue10,
        ),
      ),
      child: Text(
        title,
        style: context.textStyles.body2Semibold.copyWith(
          color: context.colors.textPrimary,
        ),
      ),
    );
  }
}
