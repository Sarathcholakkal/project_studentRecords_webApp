import 'package:flutter/material.dart';
import 'package:student_records/view/home/widgets/add_record/add_record_mobile.dart';
import 'package:student_records/view/home/widgets/app_details/app_details.dart';

class HomeViewTabletDesk extends StatelessWidget {
  const HomeViewTabletDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AppDetails(),
        Expanded(
          child: Center(
            child: AddRecordMobile(title: "Join Course"),
          ),
        )
      ],
    );
  }
}