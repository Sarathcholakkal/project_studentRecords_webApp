import 'package:flutter/material.dart';
import 'package:student_records/view/widget/nav_bar/nav_bar_item.dart';

class NavDrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String navigationPath;

  const NavDrawerItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.navigationPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 30),
          NavBarItem(title: title, navigationPath: navigationPath),
        ],
      ),
    );
  }
}
