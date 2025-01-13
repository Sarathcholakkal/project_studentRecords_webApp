import 'package:flutter/material.dart';

ValueNotifier<bool> isGridNotifier = ValueNotifier(true);

class RecordViewAll extends StatefulWidget {
  const RecordViewAll({super.key});

  @override
  State<RecordViewAll> createState() => _RecordViewAllState();
}

class _RecordViewAllState extends State<RecordViewAll> {
  final searchController = TextEditingController();
  String? filter;
  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Records"),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       isGridNotifier.value = !isGridNotifier.value;
          //     },
          //     icon: ValueListenableBuilder(
          //       valueListenable: isGridNotifier,
          //       builder: (BuildContext ctx, bool boolValue, _) {
          //         return boolValue
          //             ? const Icon(Icons.view_list)
          //             : const Icon(Icons.grid_on);
          //       },
          //     ),
          //   )
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.grey[200],
              //     borderRadius: BorderRadius.zero,
              //   ),
              //   margin:
              //       const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              //   padding: const EdgeInsets.symmetric(vertical: 5),
              //   child: TextFormField(
              //     keyboardType: TextInputType.text,
              //     controller: searchController,
              //     decoration: InputDecoration(
              //         hintText: 'search items here.....',
              //         hintStyle: TextStyle(color: Colors.grey[400]),
              //         contentPadding: const EdgeInsets.fromLTRB(40, 10, 10, 10),
              //         border: InputBorder.none),
              //   ),
              // ),
              Expanded(
                  child: GridView.builder(
                itemCount: 10,
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
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
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
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                padding: const EdgeInsets.all(5),
              )),
            ],
          ),
        ));
  }
}
