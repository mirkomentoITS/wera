import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/typography.dart';


class AppTheme {

  // THEME LIGHT
  static final lightTheme = ThemeData(

    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent,

    colorScheme: const ColorScheme.light(
      primary: LightColors.primary,
      onPrimary: LightColors.textOnBrand,
      secondary: LightColors.secondary,
      onSecondary: LightColors.textPrimary,
      surface: LightColors.bgSurface,
      surfaceContainer: LightColors.bgContainer,
      surfaceContainerLowest: LightColors.bgDefault,
      onSurface: LightColors.textPrimary,
      outline: LightColors.borderDefault,
      error: LightColors.error,
      onError: LightColors.textOnBrand,
    ),

    textTheme: _textTheme(
      LightColors.textPrimary,
      LightColors.textSecondary
    ),
  );


  // THEME DARK
  static final darkTheme = ThemeData(

    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.transparent,

    colorScheme: const ColorScheme.dark(
      primary: DarkColors.primary,
      onPrimary: DarkColors.textOnBrand,
      secondary: DarkColors.secondary,
      onSecondary: DarkColors.textPrimary,
      surface: DarkColors.bgSurface,
      surfaceContainer: DarkColors.bgContainer,
      surfaceContainerLowest: DarkColors.bgDefault,
      onSurface: DarkColors.textPrimary,
      outline: DarkColors.borderDefault,
      error: DarkColors.error,
      onError: DarkColors.textOnBrand,
    ),

    textTheme: _textTheme(
      DarkColors.textPrimary,
      DarkColors.textSecondary,
    ),
  );


  // TYPOGRAPHY
  static TextTheme _textTheme(Color color, Color secondary) {
    return TextTheme(

      headlineLarge: AppTypography.h1.copyWith(color: color),
      headlineMedium: AppTypography.h2.copyWith(color: color),
      headlineSmall: AppTypography.h3.copyWith(color: color),

      titleLarge: AppTypography.h4.copyWith(color: color),
      titleMedium: AppTypography.h5.copyWith(color: color),
      titleSmall: AppTypography.h6.copyWith(color: color),

      bodyLarge: AppTypography.bodyBig.copyWith(color: secondary),
      bodyMedium: AppTypography.body.copyWith(color: secondary),
      bodySmall: AppTypography.bodySmall.copyWith(color: secondary),

      labelLarge: AppTypography.button.copyWith(color: color),
      labelMedium: AppTypography.label.copyWith(color: color),
      labelSmall: AppTypography.caption.copyWith(color: color),
      
      displayLarge: AppTypography.display.copyWith(color: color),
      displayMedium: AppTypography.displaySerifXL.copyWith(color: color),
      displaySmall: AppTypography.displaySerifL.copyWith(color: color),
    );
  }
 
}
