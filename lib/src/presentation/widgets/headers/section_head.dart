import 'package:flutter/material.dart';

import '../../../config/theme/app_theme.dart';
import '../../../core/constants/constants.dart';
import '../buttons/primary_text_button.dart';

class SectionHead extends StatelessWidget {
  const SectionHead({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spaces.xLarge,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: context.textStyles.heading4,
            ),
          ),
          Gaps.medium,
          PrimaryTextButton(
            onPressed: () {},
            title: 'See More',
          ),
        ],
      ),
    );
  }
}
