import 'package:flutter/material.dart';
import 'package:student_records/view/home/widgets/add_record/add_recored.dart';
import 'package:student_records/view/home/widgets/app_details/app_details.dart';
import 'package:student_records/view/records/record_body/record_body.dart';
import 'package:student_records/view/records/search_record/search_record.dart';

class DeskTest extends StatelessWidget {
  const DeskTest({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SearchRecord(),
          SizedBox(
            height: 100,
          ),
          RecordBody()
        ],
      ),
    );
  }
}
