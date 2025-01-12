import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:student_records/view/home/widgets/add_record/add_record_all.dart';

class AddRecored extends StatelessWidget {
  const AddRecored({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => AddRecordAll(),
      tablet: (BuildContext context) => AddRecordAll(),
      desktop: (BuildContext context) => AddRecordAll(),
    );
  }
}
