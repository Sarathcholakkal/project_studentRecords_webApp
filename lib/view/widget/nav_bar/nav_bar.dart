import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:student_records/view/widget/nav_bar/nav_bar_tablet_desk.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      // mobile: (BuildContext context) => const NavBarMobile(),
      tablet: (BuildContext context) => const NavBarTabletDesktop(),
      desktop: (BuildContext context) => const NavBarTabletDesktop(),
    );
  }
}
