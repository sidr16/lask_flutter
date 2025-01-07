import 'package:flutter/material.dart';

import '../config/constants/constants.dart';
import '../locators/service_locator.dart';

/// Manages app theme mode (light/dark/system)
class ThemeModeProvider extends ChangeNotifier {
  /// Current theme mode
  ThemeMode _themeMode = ThemeMode.system;

  /// Get current theme mode
  ThemeMode get themeMode => _themeMode;

  /// Is dark mode active
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  /// Init flag
  bool _isInitialized = false;

  /// Load theme from prefs
  void initialize() {
    if (_isInitialized) return;

    final currentThemeMode =
        getIt.sharedPreferences.getString(SharedPrefsKeys.themeMode);

    setThemeMode(
      getThemeModeByName(currentThemeMode ?? ThemeMode.system.name),
    );

    _isInitialized = true;
  }

  /// Get current platform brightness (light/dark)
  Brightness get platformBrightness =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  /// Toggle between light and dark themes
  /// Light -> Dark -> Light if in system mode
  void toggle() {
    final currentMode = _themeMode;
    final changeThemeMode = switch (currentMode) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system => platformBrightness == Brightness.dark
          ? ThemeMode.light
          : ThemeMode.dark,
    };

    setThemeMode(changeThemeMode);
  }

  /// Update and save theme mode
  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;

    getIt.sharedPreferences.setString(
      SharedPrefsKeys.themeMode,
      themeMode.name,
    );

    notifyListeners();
  }

  /// Get ThemeMode from string name
  ThemeMode getThemeModeByName(String themeModeName) {
    return ThemeMode.values.firstWhere(
      (themeMode) => themeMode.name == themeModeName,
      orElse: () => ThemeMode.system,
    );
  }
}
