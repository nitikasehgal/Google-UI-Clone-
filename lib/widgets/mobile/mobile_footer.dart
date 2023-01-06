import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_clone/widgets/footer_text.dart';

class MobileFooter extends StatelessWidget {
  const MobileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        FooterText(title: "About"),
        SizedBox(width: 10),
        FooterText(title: "Advertising"),
        SizedBox(width: 10),
        FooterText(title: "Business"),
        SizedBox(width: 10),
        FooterText(title: "How Search Work"),
        SizedBox(width: 10),
        FooterText(title: "Privacy"),
        SizedBox(width: 10),
        FooterText(title: "Terms"),
        SizedBox(width: 10),
        FooterText(title: "Settings"),
        SizedBox(width: 10),
      ],
    );
  }
}
