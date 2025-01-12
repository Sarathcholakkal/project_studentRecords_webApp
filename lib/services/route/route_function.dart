import 'package:flutter/material.dart';
import 'package:student_records/services/route/route_name.dart';
import 'package:student_records/view/home/home_view.dart';
import 'package:student_records/view/splash/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // print('generateRoute: ${settings.name}');

  switch (settings.name) {
    // case splashRoute:
    //   return _getPageRoute(SplashScreen());
    case homeRoute:
      return _getPageRoute(HomeView());
    //   case episodesRoute:
    //     return _getPageRoute(EpisodesView());
    //   case aboutRoute:
    //     return _getPageRoute(AboutView());
    default:
      return _getPageRoute(HomeView());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
