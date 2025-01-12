import 'package:flutter/material.dart';
import 'package:student_records/theme/app_color.dart';

class NavDrawerHeader extends StatelessWidget {
  const NavDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      alignment: Alignment.center,
      child: Image.asset('assets/image/logo.png'),
    );
  }
}
