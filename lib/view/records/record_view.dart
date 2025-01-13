import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:student_records/view/records/desk_test.dart';
import 'package:student_records/view/records/mobile_test.dart';

class RecordView extends StatelessWidget {
  const RecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const MobileTest(),
      tablet: (BuildContext context) => const MobileTest(),
      desktop: (BuildContext context) => const DeskTest(),
    );
  }
}
