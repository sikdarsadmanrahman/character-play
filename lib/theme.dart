import 'package:flutter/material.dart';

class AppColor{
  static Color primaryColor = Color.fromRGBO(162, 29, 19, 1);
  static Color primaryAccent = const Color.fromRGBO(120, 14, 14, 1);
  static Color secondaryColor = const Color.fromRGBO(45, 45, 45, 1);
  static Color secondaryAccent = const Color.fromRGBO(35, 35, 35, 1);
  static Color titleColor = const Color.fromRGBO(200, 200, 200, 1);
  static Color textColor = const Color.fromRGBO(150, 150, 150, 1);
  static Color successColor = const Color.fromRGBO(9, 149, 110, 1);
  static Color highlightColor = const Color.fromRGBO(212, 172, 13, 1);
}

ThemeData primaryTheme = ThemeData(
  // seed color theme
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColor.primaryAccent,
  ),
  
  //scaffold color
  scaffoldBackgroundColor: AppColor.secondaryAccent,

  //app bar color
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.secondaryColor,
    foregroundColor: AppColor.textColor,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
  ),

  //text theme
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      color: AppColor.titleColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
    titleMedium: TextStyle(
      color: AppColor.titleColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
    bodyMedium: TextStyle(
      color: AppColor.textColor,
      fontSize: 16,
      letterSpacing: 1,
    ),
  ),

  //card theme
  cardTheme: CardThemeData(
    color: AppColor.secondaryColor.withOpacity(0.5),
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  //input decoration theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColor.secondaryColor.withOpacity(0.5),
    border: InputBorder.none,
    labelStyle: TextStyle(color: AppColor.textColor),
    prefixIconColor: AppColor.textColor,
  ),

);

