import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otto_news/theme/constant/colors.dart';

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
        headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ColorsApp.mainTextColor),
        titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ColorsApp.thirdTextColor)
      )
    )
  );
}