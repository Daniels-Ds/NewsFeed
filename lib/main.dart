import 'package:flutter/material.dart';
import 'package:otto_news/core/config/router.dart';
import 'package:otto_news/core/theme/app_theme.dart';

void main() {
  AppRouterHelper.instance;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: ScrollBehavior().copyWith(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()
        ),
      ),
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouterHelper.router,
    );
  }
}