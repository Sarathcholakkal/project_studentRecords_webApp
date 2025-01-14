import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:student_records/database/model/stundent_model.dart';
import 'package:student_records/view/edit/edit_button.dart';
import 'package:student_records/view/home/widgets/add_record/add_record_all.dart';
import 'package:student_records/view/records/widget/info_row_widget.dart';
import 'package:popover/popover.dart';

class CardDeskWidget extends StatelessWidget {
  final StudentModel student;

  const CardDeskWidget({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    if (student.image != null) {
      print("it's not nulllllllllllllll");
    }
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          student.image != null
              ? ClipOval(
                  child: Image.memory(
                    Uint8List.fromList(student.image!),
                    height: 100,
                    width: 100,
                    fit: BoxFit
                        .cover, // Ensures the image fits within the circular frame
                  ),
                )
              : Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/image/profile.jpg",
                      ),
                    ),
                  ),
                ),
          SizedBox(
            height: 30,
          ),
          Text(
            student.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(
            height: 20,
          ),
          InfoRowWidget(
              icon: Icons.phone, infoType: "Tel", info: student.number),
          SizedBox(
            height: 20,
          ),
          InfoRowWidget(
              icon: Icons.email, infoType: "Email", info: student.email),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 200,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              student.domain,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: SizedBox(child: EditButton(studentData: student)),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
