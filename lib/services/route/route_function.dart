import 'package:flutter/material.dart';
import 'package:student_records/services/route/route_name.dart';
import 'package:student_records/view/home/home_view.dart';
import 'package:student_records/view/records/record_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return _getPageRoute(HomeView());
    case recordsRoute:
      return _getPageRoute(RecordView());

    default:
      return _getPageRoute(HomeView());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
