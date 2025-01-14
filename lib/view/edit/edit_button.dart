import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:student_records/database/model/stundent_model.dart';
import 'package:student_records/view/edit/edit_screen.dart';

class EditButton extends StatelessWidget {
  final StudentModel studentData;

  const EditButton({super.key, required this.studentData});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (BuildContext context) =>
                EditScreen(studentData: studentData),
            direction: PopoverDirection.right,
            backgroundColor:
                Colors.transparent, // Alpha value equivalent to 12% opacity
            width: 400.0,
            height: 600.0,
            arrowHeight: 10.0,
            arrowWidth: 10.0,
            // Uncomment onPop if you need to handle pop actions
            // onPop: () => print('Popover was popped!'),
          );
        },
        child: Icon(Icons.edit));
  }
}
