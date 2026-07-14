import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconic/iconic.dart';
import 'package:otto_news/core/theme/constant/colors.dart';
import 'package:otto_news/features/home/news_provider.dart';
import 'package:provider/provider.dart';

import 'read later/read_later_screen.dart';
import 'home/home_screen.dart';
import 'recommendations/reccomendations_screen.dart';
import 'search/search_screen.dart';

import 'package:intl/date_symbol_data_local.dart';

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

      initializeDateFormatting();

      dio = Dio();
      listPage = [
        ChangeNotifierProvider(child: const HomeScreen(), create: (context) => NewsProvider(dio: dio)),
        const RecommendationsScreen(),
        const DeferredScreen(),
        const SearchScreen(),
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
              SizedBox(
                height: 80,
                child: GNav(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  backgroundColor: ColorsApp.mainTextColor,
                  tabBackgroundColor: ColorsApp.tabColorNavBar,
                  color: ColorsApp.mainTextColorNavBar,
                  gap: 10,
                  rippleColor: ColorsApp.favoriteColor,
                  activeColor: Colors.white,
                  tabBorderRadius: 20,
                  iconSize: 18,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  selectedIndex: currentIndex,
                  onTabChange: (index) {
                  setState(() {
                    if (currentIndex != index) {
                      currentIndex = index;
                    }
                    });
                  },
                  tabs: 
                    [
                      GButton(icon: Iconic.home_solid, text: 'Главная'),
                      GButton(icon: Iconic.eye_solid, text: 'Для вас'),
                      GButton(icon: Iconic.clock_solid, text: 'Позже'),
                      GButton(icon: Iconic.search_bold, text: 'Поиск'),
                    ]
                ),
              ),
            ]
          ),
      ),
      );
  }
}