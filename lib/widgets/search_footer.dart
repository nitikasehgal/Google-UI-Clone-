import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_clone/utils/colors.dart';

class SearchFooter extends StatelessWidget {
  const SearchFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          color: footerColor,
          padding: EdgeInsets.symmetric(
              horizontal: size <= 768 ? 10 : 150, vertical: 15),
          child: Row(children: [
            Text(
              "India",
              style: TextStyle(color: Colors.grey[700], fontSize: 15),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 20,
              width: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.circle,
              color: Color(0xff70757a),
              size: 12,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "110059-Delhi",
              style: TextStyle(color: primaryColor, fontSize: 14),
            )
          ]),
        ),
        Divider(
          height: 0,
          thickness: 0,
          color: Colors.black26,
        ),
        Container(
          color: footerColor,
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Row(children: [
            Text(
              "Help",
              style: TextStyle(color: Colors.grey[700], fontSize: 15),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Send Feedback",
              style: TextStyle(color: Colors.grey[700], fontSize: 15),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Privacy",
              style: TextStyle(color: Colors.grey[700], fontSize: 15),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Terms",
              style: TextStyle(color: Colors.grey[700], fontSize: 15),
            ),
            SizedBox(
              width: 20,
            ),
          ]),
        )
      ],
    );
  }
}
