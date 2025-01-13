import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:student_records/database/model/stundent_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel student) async {
  print(student);
  final studentDB = await Hive.openBox<StudentModel>('studentBox');

  var generatedKey = await studentDB.add(student);

  //? add generated key to same object
  StudentModel updatedStudent = StudentModel(
      id: generatedKey,
      name: student.name,
      email: student.email,
      domain: student.domain,
      number: student.number);

  // Put the updated song back into the database
  await studentDB.put(generatedKey, updatedStudent);

  getStudents();
}

Future<void> getStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('studentBox');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}
//
