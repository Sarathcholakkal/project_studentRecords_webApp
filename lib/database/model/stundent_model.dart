import 'dart:typed_data';

import 'package:hive/hive.dart';
part 'stundent_model.g.dart';

@HiveType(typeId: 0) // Ensure a unique `typeId` for each model.
class StudentModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String domain;

  @HiveField(4)
  final String number;

  @HiveField(5)
  final Uint8List? image; // Store image as Uint8List.

  StudentModel({
    this.id,
    required this.name,
    required this.email,
    required this.domain,
    required this.number,
    this.image,
  });
}
