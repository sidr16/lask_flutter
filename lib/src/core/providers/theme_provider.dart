import 'package:flutter/material.dart';

import '../config/constants/constants.dart';
import '../locators/service_locator.dart';

/// Provider that manages the app's theme mode (light/dark/system)
class ThemeModeProvider extends ChangeNotifier {
  /// Current theme mode
  ThemeMode _themeMode = ThemeMode.system;

  /// Get the current theme mode
  ThemeMode get themeMode => _themeMode;

  /// Whether dark mode is currently active
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  /// Initialize theme mode from shared preferences
  void initialize() {
    final currentThemeMode =
        getIt.sharedPreferences.getString(SharedPrefsKeys.themeMode);

    setThemeMode(
      getThemeModeByName(currentThemeMode ?? ThemeMode.system.name),
    );
  }

  /// Toggle between light and dark mode
  void toggle() {
    final changeThemeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    setThemeMode(changeThemeMode);
  }

  /// Set a new theme mode and persist it to shared preferences
  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;

    getIt.sharedPreferences.setString(
      SharedPrefsKeys.themeMode,
      themeMode.name,
    );

    notifyListeners();
  }

  /// Get a ThemeMode enum value from its string name
  ThemeMode getThemeModeByName(String themeModeName) {
    return ThemeMode.values.firstWhere(
      (themeMode) => themeMode.name == themeModeName,
    );
  }
}
