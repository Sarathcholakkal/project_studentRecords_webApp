import 'package:flutter/material.dart';

class RecordBodyAll extends StatefulWidget {
  const RecordBodyAll({super.key});

  @override
  State<RecordBodyAll> createState() => _RecordBodyAllState();
}

class _RecordBodyAllState extends State<RecordBodyAll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.red,
      child: Container(
        height: 3000,
        child: GridView.builder(
          itemCount: 100,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onDoubleTap: () {
                // Navigator.of(ctx).push(
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         StudentPage(student: student),
                //   ),
                // );
              },
              child: Container(
                decoration: const BoxDecoration(color: Colors.blue),
                child: Column(
                  children: [
                    const Text(
                      'aaa',
                      style: TextStyle(),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: Colors.red
                            // image: DecorationImage(
                            //     image: student.image != null
                            //         ? FileImage(
                            //             File(student.image))
                            //         : const AssetImage(
                            //                 "asset/image/defaulProfileImage.jpg")
                            //             as ImageProvider,
                            //     fit: BoxFit.cover),
                            ),
                      ),
                    ),
                    Text(
                      'Name',
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              // Navigator.of(context)
                              //     .push(MaterialPageRoute(
                              //   builder: (ctx) {
                              //     return UpdateScreen(
                              //         studentData: student);
                              //   },
                              // ));
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // if (student.id != null) {
                              //   deleteStudent(student.id!);
                              // }
                              // setState(() {});
                            },
                            icon: const Icon(
                              Icons.delete,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          padding: const EdgeInsets.all(5),
        ),
      ),
    );
  }
}
