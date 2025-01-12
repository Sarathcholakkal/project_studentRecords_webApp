import 'package:flutter/material.dart';
import 'package:student_records/services/route/route_name.dart';
import 'package:student_records/view/widget/nav_drawer.dart/nav_drawer_head.dart';
import 'package:student_records/view/widget/nav_drawer.dart/nav_drawer_item.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: [
          NavDrawerHeader(),
          NavDrawerItem(
              title: 'Records', icon: Icons.book, navigationPath: recordsRoute),
          NavDrawerItem(
              title: 'Home', icon: Icons.home, navigationPath: homeRoute)
        ],
      ),
    );
  }
}
