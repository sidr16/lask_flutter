import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeModeState extends Equatable {
  const ThemeModeState({required this.themeMode});
  final ThemeMode themeMode;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  @override
  List<Object?> get props => [themeMode];
}
