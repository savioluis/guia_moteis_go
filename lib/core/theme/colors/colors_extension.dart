import 'package:flutter/material.dart';
import 'package:guia_moteis_go/core/theme/colors/app_colors.dart';

extension ColorsExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get primaryColor => colorScheme.primary;
  Color get onPrimaryColor => colorScheme.onPrimary;
  Color get secondaryColor => colorScheme.secondary;
  Color get onSecondaryColor => colorScheme.onSecondary;

  Color get surfaceColor => colorScheme.surface;
  Color get onSurfaceColor => colorScheme.onSurface;

  Color get errorColor => colorScheme.error;
  Color get onErrorColor => colorScheme.onError;

  // Cores adicionais
  Color get goldColor => AppColors.gold;
  Color get greenColor => AppColors.green;
  Color get greyColor => AppColors.grey;
  Color get lightGreyColor => AppColors.lightGrey;

  // Métodos utilitários para acessar cores
  Color getBackgroundColor(bool isPrimary) =>
      isPrimary ? primaryColor : secondaryColor;
  Color getForegroundColor(bool isPrimary) =>
      isPrimary ? onPrimaryColor : onSecondaryColor;

  Color getColor(Set<WidgetState> states, {bool isPrimary = true}) {
    if (states.contains(WidgetState.disabled)) {
      return AppColors.lightGrey;
    }
    return isPrimary ? primaryColor : secondaryColor;
  }

  Color getTextColor(Set<WidgetState> states, {bool isPrimary = true}) {
    if (states.contains(WidgetState.disabled)) {
      return AppColors.lightGrey.withOpacity(0.6);
    }
    return isPrimary ? onPrimaryColor : onSecondaryColor;
  }
}
