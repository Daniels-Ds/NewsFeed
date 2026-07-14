import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otto_news/core/theme/constant/colors.dart';
import 'package:otto_news/core/theme/constant/styles.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorsApp.thirdBbgColor,
      onPrimary: ColorsApp.thirdBbgColor,
      secondary: ColorsApp.thirdBbgColor,
      onSecondary: ColorsApp.thirdBbgColor,
      error: ColorsApp.seconTextColor,
      onError: ColorsApp.seconTextColor,
      surface: ColorsApp.mainBgColor,
      onSurface: ColorsApp.mainTextColor),
      splashColor: ColorsApp.transparent,
      highlightColor: ColorsApp.transparent,
      textTheme: GoogleFonts.libreFranklinTextTheme(TextTheme(
        titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, height: 1),
        headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ColorsApp.mainTextColor),
        bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: ColorsApp.mainTextColor),
        titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ColorsApp.thirdTextColor),
        bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorsApp.mainTextColor),
        labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: ColorsApp.mainTextColor),
        labelSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ColorsApp.mainTextColorNavBar),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: BoxStyles.elevatedButtonStyle
    )
  );
}