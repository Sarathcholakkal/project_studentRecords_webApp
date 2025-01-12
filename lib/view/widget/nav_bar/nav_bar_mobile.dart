import 'package:flutter/material.dart';
import 'package:student_records/view/widget/nav_bar/nav_bar_logo.dart';

class NavBarMobile extends StatelessWidget {
  const NavBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          NavBarLogo()
        ],
      ),
    );
  }
}
