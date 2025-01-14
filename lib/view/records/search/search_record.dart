import 'package:flutter/material.dart';

// Shared ValueNotifier for the search query
ValueNotifier<String> searchFilterNotifier = ValueNotifier<String>("");

class SearchRecord extends StatefulWidget {
  const SearchRecord({super.key});

  @override
  State<SearchRecord> createState() => _SearchRecordState();
}

class _SearchRecordState extends State<SearchRecord> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      searchFilterNotifier.value =
          searchController.text; // Update search filter
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.zero,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search items here...',
          hintStyle: TextStyle(color: Colors.grey[400]),
          contentPadding: const EdgeInsets.fromLTRB(40, 10, 10, 10),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
