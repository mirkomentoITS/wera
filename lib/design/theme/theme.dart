import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/typography.dart';


class AppTheme {

  // GRADIENT
  static const lightGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      LightColors.bgStart,
      LightColors.bgEnd,
    ],
  );

  static const darkGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      DarkColors.bgStart,
      DarkColors.bgEnd,
    ],
  );
  

  // LIGHT
  static final lightTheme = ThemeData(

    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent,

    colorScheme: const ColorScheme.light(
      primary: LightColors.primary,
      onPrimary: LightColors.textOnBrand,
      secondary: LightColors.secondary,
      onSecondary: LightColors.textPrimary,
      surface: LightColors.bgSurface,
      onSurface: LightColors.textPrimary,
      outline: LightColors.borderDefault,
      error: LightColors.error,
      onError: LightColors.textOnBrand,
    ),

    textTheme: _textTheme(LightColors.textPrimary),
  );


  // DARK
  static final darkTheme = ThemeData(

    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.transparent,

    colorScheme: const ColorScheme.dark(
      primary: DarkColors.primary,
      onPrimary: DarkColors.textOnBrand,
      secondary: DarkColors.secondary,
      onSecondary: DarkColors.textPrimary,
      surface: DarkColors.bgSurface,
      onSurface: DarkColors.textPrimary,
      outline: DarkColors.borderDefault,
      error: DarkColors.error,
      onError: DarkColors.textOnBrand,
    ),

    textTheme: _textTheme(DarkColors.textPrimary),
  );


  // TYPOGRAPHY
  static TextTheme _textTheme(Color color) {
    return TextTheme(

      headlineLarge: AppTypography.h1.copyWith(color: color),
      headlineMedium: AppTypography.h2.copyWith(color: color),
      headlineSmall: AppTypography.h3.copyWith(color: color),
      titleLarge: AppTypography.h4.copyWith(color: color),
      titleMedium: AppTypography.h5.copyWith(color: color),

      bodyLarge: AppTypography.bodyBig.copyWith(color: color),
      bodyMedium: AppTypography.body.copyWith(color: color),
      bodySmall: AppTypography.bodySmall.copyWith(color: color),
      titleSmall: AppTypography.bodySemiBold.copyWith(color: color),

      labelLarge: AppTypography.button.copyWith(color: color),
      labelMedium: AppTypography.label.copyWith(color: color),
      labelSmall: AppTypography.caption.copyWith(color: color),
      
      displayLarge: AppTypography.displaySerifL.copyWith(color: color),
      displayMedium: AppTypography.bodyBoldUppercase.copyWith(color: color),
    );
  }
 
}
