import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.textLink,
    required this.textPrimary,
    required this.textSecondary,
    required this.backgroundPrimary,
    required this.brandBlue10,
    required this.navBarBackground,
    required this.grey1,
    this.brandBlue = const Color(0xff2D5BD0),
    this.colorLight = const Color(0xffCCCCCC),
    this.textPlaceholder = const Color(0xff8A8184),
  });

  final Color textLink;
  final Color textPrimary;
  final Color textSecondary;
  final Color textPlaceholder;

  final Color backgroundPrimary;

  final Color brandBlue;
  final Color brandBlue10;

  final Color navBarBackground;

  final Color colorLight;

  final Color grey1;

  static AppColors light = const AppColors(
    textPrimary: Color(0xff000000),
    textSecondary: Color(0xff6D6265),
    backgroundPrimary: Color(0xffffffff),
    brandBlue10: Color(0xffE9EEFA),
    navBarBackground: Color.fromRGBO(252, 233, 238, 0.8),
    textLink: Color(0xff0E0AB1),
    grey1: Color(0xffF0EFF0),
  );

  static AppColors dark = const AppColors(
    textPrimary: Color(0xffE0DCDD),
    textSecondary: Color(0xff9B8A8F),
    backgroundPrimary: Color(0xff0D0D0D),
    brandBlue10: Color(0xff1A1A1A),
    navBarBackground: Color.fromRGBO(28, 28, 28, 0.8),
    textLink: Color(0xff6C8CDE),
    grey1: Color(0xff1C1C1C),
  );

  @override
  ThemeExtension<AppColors> copyWith({
    Color? textLink,
    Color? textPrimary,
    Color? textSecondary,
    Color? backgroundPrimary,
    Color? brandBlue,
    Color? brandBlue10,
    Color? navBarBackground,
    Color? grey1,
  }) {
    return AppColors(
      textLink: textLink ?? this.textLink,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      brandBlue: brandBlue ?? this.brandBlue,
      brandBlue10: brandBlue10 ?? this.brandBlue10,
      navBarBackground: navBarBackground ?? this.navBarBackground,
      grey1: grey1 ?? this.grey1,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    AppColors? other,
    double t,
  ) {
    return AppColors(
      textLink: Color.lerp(textLink, other?.textLink, t) ?? textLink,
      textPrimary:
          Color.lerp(textPrimary, other?.textPrimary, t) ?? textPrimary,
      textSecondary:
          Color.lerp(textSecondary, other?.textSecondary, t) ?? textSecondary,
      backgroundPrimary:
          Color.lerp(backgroundPrimary, other?.backgroundPrimary, t) ??
              backgroundPrimary,
      brandBlue: Color.lerp(brandBlue, other?.brandBlue, t) ?? brandBlue,
      brandBlue10:
          Color.lerp(brandBlue10, other?.brandBlue10, t) ?? brandBlue10,
      navBarBackground:
          Color.lerp(navBarBackground, other?.navBarBackground, t) ??
              navBarBackground,
      grey1: Color.lerp(grey1, other?.grey1, t) ?? grey1,
    );
  }
}
