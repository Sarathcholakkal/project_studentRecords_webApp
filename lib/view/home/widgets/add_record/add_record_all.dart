import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:student_records/database/db_functions/db_functions.dart';
import 'package:student_records/database/model/stundent_model.dart';

class AddRecordAll extends StatefulWidget {
  const AddRecordAll({
    super.key,
  });

  @override
  State<AddRecordAll> createState() => _AddRecordAllState();
}

class _AddRecordAllState extends State<AddRecordAll> {
  //==============image handling------------------------
  ValueNotifier<Uint8List?> webImage = ValueNotifier(null);

  // ImagePicker imagePicker = ImagePicker();

  // Future<void> imagePickerFromGallery() async {
  //   final imgPicked = await imagePicker.pickImage(source: ImageSource.gallery);
  //   if (imgPicked != null) {
  //     final Uint8List bytes = await imgPicked.readAsBytes();
  //     setState(() {
  //       webImage.value = bytes;
  //     });
  //   }
  // }

  PlatformFile? _imageFile;
  Future<void> pickImage() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result == null) return;

      _imageFile = result.files.first;
      if (_imageFile != null)
        webImage.value = Uint8List.fromList(_imageFile!.bytes!);
    } catch (e) {
      print("not print the value");
    }
  }

  // controllers-----------------------------------------
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final domainController = TextEditingController();
  final numberController = TextEditingController();

  final RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9. !#$%&'*+-/ =? ^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final RegExp phoneValid = RegExp(r"^(?:\+91|91)?\s?[6-9]\d{9}$");
  final RegExp textValid = RegExp(r"^\s*[a-zA-Z,\s]+\s*$");

  final GlobalKey<FormState> _signInKey = GlobalKey();

  Future<void> onSubmittCliked(BuildContext ctx) async {
    final name = nameController.text.trim();
    final emil = emailController.text.trim();
    final domain = domainController.text.trim();
    final number = numberController.text.trim();
    if (webImage.value != null) {
      final student = StudentModel(
          name: name,
          email: emil,
          domain: domain,
          number: number,
          image: webImage.value!);
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          content: Text('Student data updated successfully!'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      await addStudent(student);
      // Show success Snackbar

      clearField();
    } else {
      showDialog(
          context: ctx,
          builder: (ctx1) {
            return AlertDialog(
              title: const Text('Please insert profile picture'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx1).pop();
                    },
                    child: const Text('close'))
              ],
            );
          });
    }
  }

  clearField() {
    nameController.clear();
    emailController.clear();
    domainController.clear();
    numberController.clear();
    webImage.value = null;
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
                  "Add Details",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ValueListenableBuilder(
                            valueListenable: webImage,
                            builder:
                                (BuildContext context, value, Widget? child) {
                              return CircleAvatar(
                                  //It for display image from galary
                                  radius: 60,
                                  backgroundImage: value != null
                                      ? MemoryImage(value)
                                      : null);
                            },
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: IconButton(
                              onPressed: () {
                                // imagePickerFromGallery();
                                pickImage();
                              },
                              icon: const Icon(
                                Icons.add,
                                size: 50,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
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
