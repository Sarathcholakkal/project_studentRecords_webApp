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

Future<void> updateStudent(StudentModel student) async {
  final studentDB = await Hive.openBox<StudentModel>('studentBox');
  await studentDB.put(student.id, student);
  getStudents();
}

Future<void> showDeleteConfirmation(BuildContext context, int id) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Confirm Deletion'),
      content: const Text('Are you sure you want to delete this student?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(true),
          child: const Text('Delete'),
        ),
      ],
    ),
  );

  if (result == true) {
    await deleteStudent(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Student deleted successfully')),
    );
  }
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('studentBox');

  // Delete the record with the given key (ID)
  await studentDB.delete(id);

  // Refresh the student list
  getStudents();
}
