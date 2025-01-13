import 'package:flutter/material.dart';

class InfoRowWidget extends StatelessWidget {
  final IconData icon;
  final String infoType;
  final String info;

  const InfoRowWidget(
      {super.key,
      required this.icon,
      required this.infoType,
      required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 25,
          color: Colors.blue,
        ),
        Text(
          "${infoType}:",
          style: TextStyle(
              fontWeight: FontWeight.w800, color: Colors.blue, fontSize: 18),
        ),
        Text(
          "  " + "${info}",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
        ),
      ],
    );
  }
}
//!overflow management
