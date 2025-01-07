import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.dark.backgroundPrimary,
    primaryColor: AppColors.dark.textPrimary,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    extensions: [
      AppColors.dark,
      AppTextStyles.dark,
    ],
  );

  static ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.light.backgroundPrimary,
    primaryColor: AppColors.light.textPrimary,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    extensions: [
      AppColors.light,
      AppTextStyles.light,
    ],
  );
}

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  AppColors get colors => theme.extension<AppColors>() ?? AppColors.light;

  AppTextStyles get textStyles =>
      theme.extension<AppTextStyles>() ?? AppTextStyles.light;
}
