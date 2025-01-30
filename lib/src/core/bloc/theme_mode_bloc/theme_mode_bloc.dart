import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../constants/enums.dart';
import '../../di/injectable.dart';
import '../../utils/extensions/get_it_extension.dart';
import 'theme_mode_events.dart';
import 'theme_mode_state.dart';

@injectable
class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  ThemeModeBloc() : super(const ThemeModeState(themeMode: ThemeMode.system)) {
    on<InitializeThemeMode>(_onInitializeThemeMode);
    on<ToggleThemeMode>(_onToggleThemeMode);
    on<SetThemeMode>(_onSetThemeMode);
  }

  void initialize() {
    add(InitializeThemeMode());
  }

  void toggle() {
    add(ToggleThemeMode());
  }

  Future<void> _onInitializeThemeMode(
    InitializeThemeMode event,
    Emitter<ThemeModeState> emit,
  ) async {
    final prefs = getIt.sharedPreferences;
    final savedThemeMode =
        prefs.getString(SharedPrefsKey.themeMode.name) ?? ThemeMode.system.name;
    final themeMode = _getThemeModeByName(savedThemeMode);
    emit(ThemeModeState(themeMode: themeMode));
  }

  Future<void> _onToggleThemeMode(
    ToggleThemeMode event,
    Emitter<ThemeModeState> emit,
  ) async {
    final currentTheme = state.themeMode;
    final platformBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    final newThemeMode = switch (currentTheme) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system => platformBrightness == Brightness.dark
          ? ThemeMode.light
          : ThemeMode.dark,
    };

    await _saveThemeMode(newThemeMode);
    emit(ThemeModeState(themeMode: newThemeMode));
  }

  Future<void> _onSetThemeMode(
    SetThemeMode event,
    Emitter<ThemeModeState> emit,
  ) async {
    final newThemeMode = event.themeMode;
    await _saveThemeMode(newThemeMode);
    emit(ThemeModeState(themeMode: newThemeMode));
  }

  Future<void> _saveThemeMode(ThemeMode themeMode) async {
    final prefs = getIt.sharedPreferences;
    await prefs.setString(SharedPrefsKey.themeMode.name, themeMode.name);
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere(
      (mode) => mode.name == name,
      orElse: () => ThemeMode.system,
    );
  }
}
