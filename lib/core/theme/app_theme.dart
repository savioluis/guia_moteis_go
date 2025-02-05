import 'package:flutter/material.dart';
import 'package:guia_moteis_go/core/theme/colors/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    final baseTheme = ThemeData.light();
    const colorScheme = ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      error: AppColors.error,
      onError: AppColors.onError,
    );
    return baseTheme.copyWith(
      scaffoldBackgroundColor: Colors.grey[200],
      colorScheme: colorScheme,
    );
  }
}
