import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:student_records/view/records/record_body/record_body_all.dart';

class RecordBody extends StatelessWidget {
  const RecordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => RecordBodyAll(),
      tablet: (BuildContext context) => RecordBodyAll(),
      desktop: (BuildContext context) => RecordBodyAll(),
    );
  }
}
