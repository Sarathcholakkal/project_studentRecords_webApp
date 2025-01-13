import 'package:flutter/material.dart';
import 'package:student_records/view/records/widget/card_desk_widget.dart';

class RecordGridviewTablet extends StatelessWidget {
  const RecordGridviewTablet({super.key});

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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 50,
            crossAxisSpacing: 50,
            childAspectRatio: .7),
        padding: const EdgeInsets.all(5),
      ),
    );
  }
}