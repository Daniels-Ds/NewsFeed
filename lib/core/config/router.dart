import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otto_news/features/details/details_screen.dart';
import '../../features/app.dart';
import '../../features/home/home_screen.dart';
import '../../features/recommendations/reccomendations_screen.dart';
import '../../features/search/search_screen.dart';
import '../../features/read later/read_later_screen.dart';

class AppRoutes {
  static const String detailsPath = '/details';

  static const String mainPath = '/';
  static const String homePath = '/home';
  static const String reccomendationPath = '/recommendation';
  static const String searchPath = '/search';
  static const String defferedPath = '/deferred';
  static const String profilePath = '/profile';
}

class AppRouterHelper {
  static final AppRouterHelper _instance = AppRouterHelper._internal();

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();

  static AppRouterHelper get instance => _instance;

  factory AppRouterHelper() {
    return _instance;
  }
  

  AppRouterHelper._internal() {
    final routes = <RouteBase>[
      GoRoute(
        path: AppRoutes.mainPath,
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: AppRoutes.homePath,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.reccomendationPath,
        builder: (context, state) => const RecommendationsScreen(),
      ),
      GoRoute(
        path: AppRoutes.searchPath,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: AppRoutes.defferedPath,
        builder: (context, state) => const DeferredScreen(),
      ),
      GoRoute(
        path: AppRoutes.detailsPath,
        builder: (context, state) => const DetailsScreen(),
      )
    ];

    router = GoRouter(
      routes: routes,
      initialLocation: AppRoutes.mainPath,
      navigatorKey: parentNavigatorKey
    );
  }
}