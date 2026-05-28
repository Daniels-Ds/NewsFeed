import 'package:flutter/material.dart';
import 'package:otto_news/features/app.dart';
import 'package:otto_news/features/screens/deferred/deferred_screen.dart';
import 'package:otto_news/features/screens/home/home_screen.dart';
import 'package:otto_news/features/screens/profile/profile_screen.dart';
import 'package:otto_news/features/screens/recommendations/reccomendations_screen.dart';
import 'package:otto_news/features/screens/search/search_screen.dart';
import 'package:otto_news/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: ScrollBehavior().copyWith(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()
        ),
      ),
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => MainPage(),
        '/home' : (context) => HomeScreen(),
        '/reccomendation' : (context) => ReccomendationsScreen(),
        '/search' : (context) => SearchScreen(),
        '/deffered' : (context) => DeferredScreen(),
        '/profile' : (context) => ProfileScreen(),
      },
    );
  }
}