import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';
import 'package:otto_news/core/theme/constant/colors.dart';
import 'package:otto_news/features/home/news_provider.dart';
import 'package:provider/provider.dart';

import 'read later/read_later_screen.dart';
import 'home/home_screen.dart';
import 'profile/profile_screen.dart';
import 'recommendations/reccomendations_screen.dart';
import 'search/search_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final Dio dio;
  late List listPage;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
      dio = Dio();
      listPage = [
        ChangeNotifierProvider(child: const HomeScreen(), create: (context) => NewsProvider(dio: dio)),
        const RecommendationsScreen(),
        const DeferredScreen(),
        const SearchScreen(),
        const ProfileScreen(),
    ];
  }

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