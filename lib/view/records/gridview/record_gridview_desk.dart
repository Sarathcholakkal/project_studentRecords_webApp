import 'package:flutter/material.dart';
import 'package:student_records/database/db_functions/db_functions.dart';
import 'package:student_records/database/model/stundent_model.dart';
import 'package:student_records/view/records/search/search_record.dart';
import 'package:student_records/view/records/widget/card_desk_widget.dart';

class RecordGridviewDesk extends StatefulWidget {
  const RecordGridviewDesk({super.key});

  @override
  State<RecordGridviewDesk> createState() => _RecordGridviewDeskState();
}

class _RecordGridviewDeskState extends State<RecordGridviewDesk> {
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

              // Check if the filtered list is empty
              if (filteredList.isEmpty) {
                return Container(
                  height: 1000,
                  width: 1000,
                  alignment: Alignment.topCenter,
                  child: Text(
                    'No records found.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                );
              }

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
                  childAspectRatio: .7,
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
