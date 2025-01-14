import 'package:flutter/material.dart';
import 'package:student_records/database/db_functions/db_functions.dart';
import 'package:student_records/database/model/stundent_model.dart';
import 'package:student_records/view/records/search/search_record.dart';
import 'package:student_records/view/records/widget/card_desk_widget.dart';

class RecordGridviewMobile extends StatefulWidget {
  const RecordGridviewMobile({super.key});

  @override
  State<RecordGridviewMobile> createState() => _RecordGridviewMobileState();
}

class _RecordGridviewMobileState extends State<RecordGridviewMobile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3000,
      width: double.infinity,
      child: ValueListenableBuilder<String>(
        valueListenable:
            searchFilterNotifier, // Listen for search query changes
        builder: (context, filter, _) {
          return ValueListenableBuilder<List<StudentModel>>(
            valueListenable: studentListNotifier,
            builder: (BuildContext context, List<StudentModel> students, _) {
              // Filter the student list based on the search query
              List<StudentModel> filteredList = students
                  .where((student) =>
                      student.name.toLowerCase().contains(filter.toLowerCase()))
                  .toList();

              return GridView.builder(
                itemCount: filteredList.length,
                itemBuilder: (ctx, index) {
                  final student = filteredList[index];
                  return CardDeskWidget(student: student);
                },
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 50,
                  childAspectRatio: .8,
                ),
                padding: const EdgeInsets.all(5),
              );
            },
          );
        },
      ),
    );
  }
}
