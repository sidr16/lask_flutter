import 'package:flutter/material.dart';

import '../../../config/theme/app_theme.dart';
import '../../../core/constants/constants.dart';

class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton({
    required this.onPressed,
    required this.title,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: TextButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: Spaces.small,
            ),
          ),
        ),
        child: Text(
          title,
          style: context.textStyles.buttonMedium,
        ),
      ),
    );
  }
}
