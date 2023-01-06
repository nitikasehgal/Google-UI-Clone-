import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_clone/widgets/search_tab.dart';

class SearchTabs extends StatelessWidget {
  const SearchTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SearchTab(
            isActive: true,
            icon: Icons.search,
            title: "All",
          ),
          SizedBox(
            width: 20,
          ),
          SearchTab(
            isActive: false,
            icon: Icons.image,
            title: "Images",
          ),
          SizedBox(
            width: 20,
          ),
          SearchTab(
            isActive: false,
            icon: Icons.video_collection,
            title: "Videos",
          ),
          SizedBox(
            width: 20,
          ),
          SearchTab(
            isActive: false,
            icon: Icons.article,
            title: "News",
          ),
          SizedBox(
            width: 20,
          ),
          SearchTab(
            isActive: false,
            icon: Icons.map,
            title: "Maps",
          ),
          SizedBox(
            width: 20,
          ),
          SearchTab(
            isActive: false,
            icon: Icons.more_vert,
            title: "More",
          )
        ],
      ),
    );
  }
}
