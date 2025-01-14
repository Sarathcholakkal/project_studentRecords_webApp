import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:student_records/database/db_functions/db_functions.dart';
import 'package:student_records/database/model/stundent_model.dart';

class EditScreen extends StatefulWidget {
  final StudentModel studentData;

  const EditScreen({super.key, required this.studentData});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController domainController;
  late TextEditingController numberController;
  late Uint8List image;
  late int id;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.studentData.name);
    emailController = TextEditingController(text: widget.studentData.email);
    domainController = TextEditingController(text: widget.studentData.domain);
    numberController = TextEditingController(text: widget.studentData.number);
    image = widget.studentData.image;
    id = widget.studentData.id!;

    super.initState();
  }

  final RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9. !#$%&'*+-/ =? ^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final RegExp phoneValid = RegExp(r"^(?:\+91|91)?\s?[6-9]\d{9}$");
  final RegExp textValid = RegExp(r"^\s*[a-zA-Z,\s]+\s*$");

  final GlobalKey<FormState> _signInKey = GlobalKey();
  // Function to pick an image
  PlatformFile? _imageFile;
  FilePickerResult? result;
  Future<void> pickImage() async {
    try {
      result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result == null) return;
      setState(() {
        _imageFile = result!.files.first;
      });
    } catch (e) {}
  }

  Future<void> onSubmittCliked(BuildContext ctx) async {
    print('one submitte pressed');
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final domain = domainController.text.trim();
    final number = numberController.text.trim();

    final student = StudentModel(
        id: id,
        name: name,
        email: email,
        domain: domain,
        number: number,
        image: image);
    updateStudent(student);
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        content: Text('Student data Edited successfully!'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );

    Navigator.of(context).pop();
  }

  clearField() {
    nameController.clear();
    emailController.clear();
    domainController.clear();
    numberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(25),
          width: 400,
          height: 600,
          child: Form(
            key: _signInKey,
            child: Column(
              children: [
                Text(
                  "Updated Details",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter name';
                            } else if (!textValid.hasMatch(value)) {
                              return 'invalid format';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter your name',
                            contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                            filled: true,
                            // Optional: background color
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                    12), // Adjust the radius as needed
                              ),
                              borderSide:
                                  BorderSide.none, // Removes the border line
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter email id';
                            } else if (!emailValid.hasMatch(value)) {
                              return 'invalid format';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                            filled: true,
                            // Optional: background color
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                    12), // Adjust the radius as needed
                              ),
                              borderSide:
                                  BorderSide.none, // Removes the border line
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: domainController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter a domain name';
                            } else if (!textValid.hasMatch(value)) {
                              return 'invalid format';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter your domain',
                            contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                            filled: true,
                            // Optional: background color
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                    12), // Adjust the radius as needed
                              ),
                              borderSide:
                                  BorderSide.none, // Removes the border line
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: numberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter a value';
                            } else if (!phoneValid.hasMatch(value)) {
                              return 'invalid format';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter your phone number',
                            contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                            filled: true,
                            // Optional: background color
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                    12), // Adjust the radius as needed
                              ),
                              borderSide:
                                  BorderSide.none, // Removes the border line
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_signInKey.currentState!.validate()) {
                            debugPrint('form validated');
                            onSubmittCliked(context);
                          } else {
                            debugPrint("form not vlidated");
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              Colors.blue, // Button background color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15), // Adjust size
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                        ),
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 20, // Font size
                            fontWeight: FontWeight.bold, // Font weight
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
