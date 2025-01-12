import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeModeEvent extends Equatable {
  const ThemeModeEvent();

  @override
  List<Object?> get props => [];
}

class InitializeThemeMode extends ThemeModeEvent {}

class ToggleThemeMode extends ThemeModeEvent {}

class SetThemeMode extends ThemeModeEvent {
  const SetThemeMode(this.themeMode);
  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];
}
