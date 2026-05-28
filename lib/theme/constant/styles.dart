import 'package:flutter/material.dart';

import 'colors.dart';

class BoxStyles {
  static final BoxDecoration cardDecoration = BoxDecoration(
    color: ColorsApp.mainBgColor,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: ColorsApp.shadowCard.withValues(alpha: 0.3),
        blurRadius: 5,
        offset: const Offset(0, 0),
        spreadRadius: 0.5,
      )
    ]
  );

  static final BoxDecoration imageInCardDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10)
  );
}