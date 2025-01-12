import 'package:flutter/material.dart';
import 'package:student_records/services/locator/locator.dart';
import 'package:student_records/services/locator/navigation_services.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;

  const NavBarItem(
      {super.key, required this.title, required this.navigationPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().navigateTo(navigationPath);
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
