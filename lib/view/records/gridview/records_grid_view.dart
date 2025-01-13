import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:student_records/view/records/gridview/record_gridview_desk.dart';
import 'package:student_records/view/records/gridview/record_gridview_mobile.dart';
import 'package:student_records/view/records/gridview/record_gridview_tablet.dart';

class RecordsGridView extends StatelessWidget {
  const RecordsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => RecordGridviewMobile(),
      tablet: (BuildContext context) => RecordGridviewTablet(),
      desktop: (BuildContext context) => RecordGridviewDesk(),
    );
  }
}
