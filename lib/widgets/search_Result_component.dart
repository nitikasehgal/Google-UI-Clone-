// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_clone/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResultComponent extends StatefulWidget {
  final String link;
  final String linktoGo;

  final String text;
  final String desc;
  const SearchResultComponent({
    Key? key,
    required this.link,
    required this.linktoGo,
    required this.text,
    required this.desc,
  }) : super(key: key);

  @override
  State<SearchResultComponent> createState() => _SearchResultComponentState();
}

class _SearchResultComponentState extends State<SearchResultComponent> {
  bool _showUnderline = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.link,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: InkWell(
              onTap: () async {
                if (await canLaunchUrl(Uri.parse(widget.linktoGo))) {
                  await launchUrl(Uri.parse(widget.linktoGo));
                }
              },
              onHover: (hovering) {
                setState(() {
                  _showUnderline = hovering;
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.link,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff202124),
                    ),
                  ),
                  Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: blueColor,
                      decoration: _showUnderline
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  ),
                ],
              )),
        ),
        Text(
          widget.desc,
          style: TextStyle(fontSize: 14, color: primaryColor),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
