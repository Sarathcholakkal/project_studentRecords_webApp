import 'package:flutter/material.dart';
import 'package:student_records/view/records/widget/card_desk_widget.dart';

class RecordGridviewDesk extends StatefulWidget {
  const RecordGridviewDesk({super.key});

  @override
  State<RecordGridviewDesk> createState() => _RecordGridviewDeskState();
}

class _RecordGridviewDeskState extends State<RecordGridviewDesk> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3000,
      width: double.infinity,
      child: GridView.builder(
        itemCount: 50,
        itemBuilder: (ctx, index) {
          return CardDeskWidget();
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          childAspectRatio: .7,
        ),
        padding: const EdgeInsets.all(5),
      ),
    );
  }
}
