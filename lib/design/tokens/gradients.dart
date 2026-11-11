import 'package:flutter/material.dart';
import 'colors.dart';


class AppGradients {

  // BACKGROUND
  static const lightBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      LightColors.bgStart,
      LightColors.bgEnd,
    ],
    stops: [0.0, 1.0],
  );

  static const darkBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      DarkColors.bgStart,
      DarkColors.bgEnd,
    ],
    stops: [0.0, 1.0],
  );


  // BRAND
  static const lightBrand = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      LightColors.brandStart,
      LightColors.brandEnd,
    ],
    stops: [0.0, 1.0],
  );

  static const darkBrand = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      DarkColors.brandStart,
      DarkColors.brandEnd,
    ],
    stops: [0.0, 1.0],
  );


  // HERO
  static const lightHero = LinearGradient(
    begin: Alignment(-0.4, -0.8),
    end: Alignment(0.4, 0.9),
    colors: [
      LightColors.heroStart,
      LightColors.heroEnd,
    ],
    stops: [0.0, 1.0],
  );

  static const darkHero = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      DarkColors.heroStart,
      DarkColors.heroEnd,
    ],
    stops: [0.0, 1.0],
  );


  static LinearGradient background(BuildContext context) {
    final isDark =
      Theme.of(context).brightness == Brightness.dark;

    return isDark ? darkBackground : lightBackground;
  }

  static LinearGradient brand(BuildContext context) {
    final isDark =
      Theme.of(context).brightness == Brightness.dark;

    return isDark ? darkBrand : lightBrand;
  }

  static LinearGradient hero(BuildContext context) {
    final isDark =
      Theme.of(context).brightness == Brightness.dark;

    return isDark ? darkHero : lightHero;
  }

}
