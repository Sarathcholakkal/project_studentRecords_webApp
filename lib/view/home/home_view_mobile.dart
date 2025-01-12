import 'package:flutter/material.dart';
import 'package:student_records/view/home/widgets/add_record/add_recored.dart';
import 'package:student_records/view/home/widgets/app_details/app_details.dart';

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppDetails(),
          SizedBox(
            height: 100,
          ),
          AddRecored()
        ],
      ),
    );
  }
}
