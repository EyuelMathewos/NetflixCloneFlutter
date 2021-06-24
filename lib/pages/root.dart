import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:netflixclone/JSON/menu.dart';
import 'package:netflixclone/pages/home.dart';
import 'package:netflixclone/pages/upcoming.dart';
import 'package:netflixclone/pages/search.dart';

class RootApp extends StatefulWidget {
  @override
  rootState createState() => rootState();
}

class rootState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: footer(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        Home(),
        Upcoming(),
        Search(),
        Center(
          child: Text("Downloads", style: TextStyle(fontSize: 20, color: Colors.white)),
        )
      ],
    );
  }

  Widget footer() {
    return Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = index;
                  });
                },
                child: Column(children: [
                  Icon(
                    items[index]['icon'],
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(items[index]['text'], style: TextStyle(color: Colors.white, fontSize: 10))
                ]),
              );
              //return GestureDetector
            }),
          ),
          //Row
        ));
  }
}
