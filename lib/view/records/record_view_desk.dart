import 'package:flutter/material.dart';
import 'package:student_records/view/records/gridview/records_grid_view.dart';
import 'package:student_records/view/records/search/search_record.dart';

class RecordViewDesk extends StatelessWidget {
  const RecordViewDesk({super.key});

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
          RecordsGridView()
        ],
      ),
    );
  }
}
