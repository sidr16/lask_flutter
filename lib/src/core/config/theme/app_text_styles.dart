import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_typography.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  const AppTextStyles({
    required this.heading5,
    required this.heading4,
    required this.heading3,
    required this.heading2,
    required this.body1Regular,
    required this.body2Regular,
    required this.body2Semibold,
    required this.buttonMedium,
    required this.footnoteRegular,
    required this.footnoteSemibold,
  });

  final TextStyle heading5;
  final TextStyle heading4;
  final TextStyle heading3;
  final TextStyle heading2;
  final TextStyle body1Regular;
  final TextStyle body2Regular;
  final TextStyle body2Semibold;
  final TextStyle buttonMedium;
  final TextStyle footnoteSemibold;
  final TextStyle footnoteRegular;

  @override
  ThemeExtension<AppTextStyles> copyWith({
    TextStyle? heading2,
    TextStyle? heading3,
    TextStyle? heading4,
    TextStyle? heading5,
    TextStyle? body1Regular,
    TextStyle? body2Regular,
    TextStyle? body2Semibold,
    TextStyle? buttonMedium,
    TextStyle? footnoteSemibold,
    TextStyle? footnoteRegular,
  }) {
    return AppTextStyles(
      heading2: heading2 ?? this.heading2,
      heading3: heading3 ?? this.heading3,
      heading4: heading4 ?? this.heading4,
      heading5: heading5 ?? this.heading5,
      body1Regular: body1Regular ?? this.body1Regular,
      body2Regular: body2Regular ?? this.body2Regular,
      body2Semibold: body2Semibold ?? this.body2Semibold,
      buttonMedium: buttonMedium ?? this.buttonMedium,
      footnoteSemibold: footnoteSemibold ?? this.footnoteSemibold,
      footnoteRegular: footnoteRegular ?? this.footnoteRegular,
    );
  }

  @override
  ThemeExtension<AppTextStyles> lerp(
    AppTextStyles? other,
    double t,
  ) {
    return AppTextStyles(
      heading2: TextStyle.lerp(heading2, other?.heading2, t) ?? heading2,
      heading3: TextStyle.lerp(heading3, other?.heading3, t) ?? heading3,
      heading4: TextStyle.lerp(heading4, other?.heading4, t) ?? heading4,
      heading5: TextStyle.lerp(heading5, other?.heading5, t) ?? heading5,
      body1Regular:
          TextStyle.lerp(body1Regular, other?.body1Regular, t) ?? body1Regular,
      body2Regular:
          TextStyle.lerp(body2Regular, other?.body2Regular, t) ?? body2Regular,
      body2Semibold: TextStyle.lerp(body2Semibold, other?.body2Semibold, t) ??
          body2Semibold,
      buttonMedium:
          TextStyle.lerp(buttonMedium, other?.buttonMedium, t) ?? buttonMedium,
      footnoteSemibold:
          TextStyle.lerp(footnoteSemibold, other?.footnoteSemibold, t) ??
              footnoteSemibold,
      footnoteRegular:
          TextStyle.lerp(footnoteRegular, other?.footnoteRegular, t) ??
              footnoteRegular,
    );
  }

  static final AppTextStyles light = AppTextStyles(
    heading5: AppTypography.heading5,
    heading4: AppTypography.heading4,
    heading3: AppTypography.heading3,
    heading2: AppTypography.heading2,
    body1Regular: AppTypography.body1Regular,
    body2Regular: AppTypography.body2Regular.copyWith(
      color: AppColors.light.textSecondary,
    ),
    body2Semibold: AppTypography.body2Semibold.copyWith(
      color: AppColors.light.backgroundPrimary,
    ),
    buttonMedium: AppTypography.buttonMedium.copyWith(
      color: AppColors.light.brandBlue,
    ),
    footnoteRegular: AppTypography.footnoteRegular.copyWith(
      color: AppColors.light.textSecondary,
    ),
    footnoteSemibold: AppTypography.footnoteSemibold.copyWith(
      color: AppColors.light.textSecondary,
    ),
  );

  static final AppTextStyles dark = AppTextStyles(
    heading5: AppTypography.heading5,
    heading4: AppTypography.heading4,
    heading3: AppTypography.heading3,
    heading2: AppTypography.heading2,
    body1Regular: AppTypography.body1Regular,
    body2Regular: AppTypography.body2Regular.copyWith(
      color: AppColors.dark.textSecondary,
    ),
    body2Semibold: AppTypography.body2Semibold.copyWith(
      color: AppColors.dark.backgroundPrimary,
    ),
    buttonMedium: AppTypography.buttonMedium.copyWith(
      color: AppColors.dark.brandBlue,
    ),
    footnoteRegular: AppTypography.footnoteRegular.copyWith(
      color: AppColors.dark.textSecondary,
    ),
    footnoteSemibold: AppTypography.footnoteSemibold.copyWith(
      color: AppColors.dark.textSecondary,
    ),
  );
}
