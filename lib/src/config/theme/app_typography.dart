import 'package:flutter/material.dart';

@immutable
class AppTypography {
  const AppTypography._();

  static const TextStyle heading2 = TextStyle(
    fontSize: 40,
    letterSpacing: 0.48,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 32,
    letterSpacing: 0.40,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle heading4 = TextStyle(
    fontSize: 24,
    letterSpacing: 0.28,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle heading5 = TextStyle(
    fontSize: 18,
    letterSpacing: 0.24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body1Regular = TextStyle(
    fontSize: 16,
    letterSpacing: 0.3,
  );

  static const TextStyle body2Regular = TextStyle(
    fontSize: 14,
    letterSpacing: 0.2,
  );

  static const TextStyle body2Semibold = TextStyle(
    fontSize: 14,
    letterSpacing: 0.2,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: 16,
    letterSpacing: 0.2,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle footnoteSemibold = TextStyle(
    fontSize: 12,
    letterSpacing: 0.18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle footnoteRegular = TextStyle(
    fontSize: 12,
    letterSpacing: 0.18,
  );
}
