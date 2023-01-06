import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_clone/utils/colors.dart';

class SearchButton extends StatelessWidget {
  final String text;
  SearchButton(this.text);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
      color: searchColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Text(text),
    );
  }
}
