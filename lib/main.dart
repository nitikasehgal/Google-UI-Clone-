import 'package:flutter/material.dart';
import 'package:google_clone/responsive/mobile_Screen_layout.dart';
import 'package:google_clone/responsive/responsive_layout_screen.dart';
import 'package:google_clone/responsive/web_Screen_layout.dart';
import 'package:google_clone/screens/search_screen.dart';
import 'package:google_clone/utils/colors.dart';

void main() {
  runApp(GoogleClone());
}

class GoogleClone extends StatefulWidget {
  const GoogleClone({super.key});

  @override
  State<GoogleClone> createState() => _GoogleCloneState();
}

class _GoogleCloneState extends State<GoogleClone> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Google Clone",
      debugShowCheckedModeBanner: false,
      routes: {},
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: ResponsiveLayoutScreen(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}
