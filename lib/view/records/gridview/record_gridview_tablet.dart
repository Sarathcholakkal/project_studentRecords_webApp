import 'package:flutter/material.dart';
import 'package:student_records/database/db_functions/db_functions.dart';
import 'package:student_records/database/model/stundent_model.dart';
import 'package:student_records/view/records/widget/card_desk_widget.dart';

class RecordGridviewTablet extends StatelessWidget {
  const RecordGridviewTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3000,
      width: double.infinity,
      child: ValueListenableBuilder<List<StudentModel>>(
        valueListenable: studentListNotifier,
        builder: (BuildContext context, List<StudentModel> students, _) {
          return GridView.builder(
            itemCount: students.length,
            itemBuilder: (ctx, index) {
              final student = students[index];
              return CardDeskWidget(student: student);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 50,
              crossAxisSpacing: 50,
              childAspectRatio: .7,
            ),
            padding: const EdgeInsets.all(5),
          );
        },
      ),
    );
  }
}
