import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:student_records/view/home/widgets/add_record/add_record_mobile.dart';
import 'package:student_records/view/home/widgets/add_record/add_record_tablet_desk.dart';

class AddRecored extends StatelessWidget {
  final String title;

  const AddRecored({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => AddRecordMobile(
        title: title,
      ),
      tablet: (BuildContext context) => AddRecordTabletDesk(
        title: title,
      ),
      desktop: (BuildContext context) => AddRecordTabletDesk(
        title: title,
      ),
    );
  }
}
