import 'package:flutter/material.dart';

import 'app_colors.dart';
class AppThemes {
  AppThemes._();
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSurface,
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.onTertiary,
        error: AppColors.error,
        onError: AppColors.onError,
        background: AppColors.background,
        onBackground: AppColors.onBackground,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface),
    dividerTheme: const DividerThemeData(color: Colors.black26),
  );

  static final darkTheme = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.primaryDark,
          onPrimary: AppColors.onPrimaryDark,
          secondary: AppColors.secondaryDark,
          onSecondary: AppColors.onSurfaceDark,
          tertiary: AppColors.tertiaryDark,
          onTertiary: AppColors.onTertiaryDark,
          error: AppColors.errorDark,
          onError: AppColors.onErrorDark,
          background: AppColors.backgroundDark,
          onBackground: AppColors.onBackgroundDark,
          surface: AppColors.surfaceDark,
          onSurface: AppColors.onSurfaceDark),
      dividerTheme: const DividerThemeData(color: Colors.white38)
  );
}