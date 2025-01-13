import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:student_records/view/records/record_view_desk.dart';
import 'package:student_records/view/records/record_view_mobile.dart';

class RecordView extends StatelessWidget {
  const RecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const RecordViewMobile(),
      tablet: (BuildContext context) => const RecordViewMobile(),
      desktop: (BuildContext context) => const RecordViewDesk(),
    );
  }
}
