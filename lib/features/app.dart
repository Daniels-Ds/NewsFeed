import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';
import 'package:otto_news/theme/constant/colors.dart';

import 'screens/deferred/deferred_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/recommendations/reccomendations_screen.dart';
import 'screens/search/search_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final List listPage = [
    HomeScreen(),
    ReccomendationsScreen(),
    DeferredScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
              listPage[currentIndex],
              BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              iconSize: 20,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              selectedItemColor: ColorsApp.seconTextColor,
              unselectedItemColor: ColorsApp.thirdTextColor,
              items: 
                [
                  BottomNavigationBarItem(icon: Icon(Iconic.home_solid), label: 'Главная'),
                  BottomNavigationBarItem(icon: Icon(Iconic.eye_solid), label: 'Для вас'),
                  BottomNavigationBarItem(icon: Icon(Iconic.clock_solid), label: 'Позже'),
                  BottomNavigationBarItem(icon: Icon(Iconic.search_bold), label: 'Поиск'),
                  BottomNavigationBarItem(icon: Icon(Iconic.settings_solid), label: 'Настройки')
                ]
              ),
            ]
          ),
      ),
      );
  }
}