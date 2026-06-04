import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppBarTitleWidget extends StatelessWidget {
  final String title;
  const AppBarTitleWidget({
    super.key, 
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
      style: AppTheme.themeData.textTheme.headlineLarge
    );
  }
}