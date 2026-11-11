import 'package:flutter/material.dart';
import 'colors.dart';



class AppShadows {

  AppShadows._();


  // CARD
  static const List<BoxShadow> lightCard = [
    BoxShadow(
      color: LightColors.shadowBrand,
      offset: Offset(0, 8),
      blurRadius: 24,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> darkCard = [
    BoxShadow(
      color: DarkColors.shadowBrand,
      offset: Offset(0, 8),
      blurRadius: 24,
      spreadRadius: 0,
    ),
  ];


  // BUTTON
  static const List<BoxShadow> lightButton = [
    BoxShadow(
      color: LightColors.shadowBrand,
      offset: Offset(0, 10),
      blurRadius: 20,
      spreadRadius: -2,
    ),
  ];

  static const List<BoxShadow> darkButton = [
    BoxShadow(
      color: DarkColors.shadowBrand,
      offset: Offset(0, 10),
      blurRadius: 20,
      spreadRadius: -2,
    ),
  ];


  // NAVIGATOR
  static const List<BoxShadow> lightNav = [
    BoxShadow(
      color: LightColors.shadowBrand,
      offset: Offset(0, -4),
      blurRadius: 24,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> darkNav = [
    BoxShadow(
      color: DarkColors.shadowBrand,
      offset: Offset(0, -4),
      blurRadius: 24,
      spreadRadius: 0,
    ),
  ];


  // GARMENT
  static const List<BoxShadow> lightGarment = [
    BoxShadow(
      color: LightColors.shadowBrand,
      offset: Offset(0, 6),
      blurRadius: 8,
      spreadRadius: -1,
    ),
  ];

  static const List<BoxShadow> darkGarment = [
    BoxShadow(
      color: DarkColors.shadowBrand,
      offset: Offset(0, 6),
      blurRadius: 8,
      spreadRadius: -1,
    ),
  ];


  static List<BoxShadow> card(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkCard : lightCard;

  static List<BoxShadow> button(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkButton : lightButton;

  static List<BoxShadow> nav(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkNav : lightNav;

  static List<BoxShadow> garment(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkGarment : lightGarment;
      
}
