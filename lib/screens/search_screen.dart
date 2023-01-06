import 'package:flutter/material.dart';
import 'package:google_clone/services/api_service.dart';
import 'package:google_clone/utils/colors.dart';
import 'package:google_clone/widgets/search_footer.dart';
import 'package:google_clone/widgets/search_tabs.dart';

import '../widgets/search_Result_component.dart';
import '../widgets/search_header.dart';

class SearchScreen extends StatefulWidget {
  final String searchQuery;
  final String start;
  SearchScreen(this.searchQuery, this.start);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Title(
      color: Colors.blue,
      title: widget.searchQuery,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchHeader(),
                Padding(
                  padding:
                      EdgeInsets.only(left: size.width <= 768 ? 10 : 150.0),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal, child: SearchTabs()),
                ),
                Divider(
                  height: 0,
                  thickness: 0.5,
                ),
                FutureBuilder(
                  future: apiService.fetchData(
                      queryTerm: widget.searchQuery, start: widget.start),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: size.width <= 768 ? 10 : 150, top: 12),
                            child: Text(
                              "About ${(snapshot.data as dynamic)['searchInformation']['formattedTotalResults']} results (${(snapshot.data as dynamic)['searchInformation']['formattedSearchTime']} seconds)",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF70757a),
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: size.width <= 768 ? 10 : 150,
                                    top: 10),
                                child: SearchResultComponent(
                                  desc: (snapshot.data as dynamic)['items']
                                      [index]['snippet'],
                                  link: (snapshot.data as dynamic)['items']
                                      [index]['formattedUrl'],
                                  linktoGo: (snapshot.data as dynamic)['items']
                                      [index]['link'],
                                  text: (snapshot.data as dynamic)['items']
                                      [index]['title'],
                                ),
                              );
                            },
                            itemCount:
                                (snapshot.data as dynamic)['items'].length,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      if (widget.start != "0") {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SearchScreen(
                                              widget.searchQuery,
                                              (int.parse(widget.start) - 10)
                                                  .toString());
                                        }));
                                      }
                                    },
                                    child: Text(
                                      "< Prev",
                                      style: TextStyle(
                                          color: blueColor, fontSize: 15),
                                    )),
                                SizedBox(
                                  width: 30,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return SearchScreen(
                                            widget.searchQuery,
                                            (int.parse(widget.start) + 10)
                                                .toString());
                                      }));
                                    },
                                    child: Text(
                                      "Next >",
                                      style: TextStyle(
                                          color: blueColor, fontSize: 15),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SearchFooter()
                        ],
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
