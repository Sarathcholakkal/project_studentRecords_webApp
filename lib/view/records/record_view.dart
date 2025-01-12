import 'package:flutter/material.dart';

class RecordView extends StatelessWidget {
  const RecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.red,
      child: Center(
        child: Text(
          "records",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
