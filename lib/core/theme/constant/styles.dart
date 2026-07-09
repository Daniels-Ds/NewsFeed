import 'package:flutter/material.dart';

import 'colors.dart';

class BoxStyles {
  static final BoxDecoration cardDecoration = BoxDecoration(
    color: ColorsApp.mainBgColor,
    // borderRadius: BorderRadius.circular(10),
  );

  static final BoxDecoration imageInCardDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10)
  );

  static final ButtonStyle elevatedButtonStyle = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(ColorsApp.seconBbgColor),
    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10))
    ),
    foregroundColor: WidgetStatePropertyAll(ColorsApp.mainTextColor),
  );
}