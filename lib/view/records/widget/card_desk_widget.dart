import 'package:flutter/material.dart';
import 'package:student_records/view/records/widget/info_row_widget.dart';

class CardDeskWidget extends StatelessWidget {
  const CardDeskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage("assets/image/profile.jpg"),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Jeslin James",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(
            height: 20,
          ),
          InfoRowWidget(icon: Icons.phone, infoType: "Tel", info: "9020848454"),
          SizedBox(
            height: 20,
          ),
          InfoRowWidget(
              icon: Icons.email,
              infoType: "Email",
              info: "sarathcholakkal@gmail.com"),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 200,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Flutter",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
