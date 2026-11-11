import 'package:flutter/material.dart';


class AppTypography {

  // FONT FAMILY
  static const String headingFont = 'PlusJakartaSans';
  static const String bodyFont = 'PlusJakartaSans';
  static const String displayFont = 'PlayfairDisplay';


  // DISPLAY
  static const display = TextStyle(
    fontFamily: headingFont,
    fontSize: 48,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.96,
  );

  static const displaySerifXL = TextStyle(
    fontFamily: displayFont,
    fontSize: 34,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    height: 1.05,
    letterSpacing: -0.34,
  );

  static const displaySerifL = TextStyle(
    fontFamily: displayFont,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    height: 1.05,
    letterSpacing: -0.28,
  );


  // HEADINGS
  static const h1 = TextStyle(
    fontFamily: headingFont,
    fontSize: 32,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.64,
  );

  static const h2 = TextStyle(
    fontFamily: headingFont,
    fontSize: 26,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.39,
  );

  static const h3 = TextStyle(
    fontFamily: headingFont,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.22,
  );

  static const h4 = TextStyle(
    fontFamily: headingFont,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.10,
  );

  static const h5 = TextStyle(
    fontFamily: headingFont,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static const h6 = TextStyle(
    fontFamily: headingFont,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );


  // TITLES
  static const title = TextStyle(
    fontFamily: headingFont,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.12,
  );

  static const subtitle = TextStyle(
    fontFamily: bodyFont,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );


  // BODY
  static const bodyBig = TextStyle(
    fontFamily: bodyFont,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const body = TextStyle(
    fontFamily: bodyFont,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const bodySemiBold = TextStyle(
    fontFamily: bodyFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const bodySmall = TextStyle(
    fontFamily: bodyFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const bodyBoldUppercase = TextStyle(
    fontFamily: bodyFont,
    fontSize: 12,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.96,
  );


  // SUPPORT
  static const caption = TextStyle(
    fontFamily: bodyFont,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const button = TextStyle(
    fontFamily: headingFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const label = TextStyle(
    fontFamily: bodyFont,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

}
