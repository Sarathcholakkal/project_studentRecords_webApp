import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:student_records/view/home/home_view_mobile.dart';
import 'package:student_records/view/home/home_view_tablet_desk.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const HomeViewMobile(),
      tablet: (BuildContext context) => const HomeViewMobile(),
      desktop: (BuildContext context) => const HomeViewTabletDesk(),
    );
  }
}
