import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:netflixclone/JSON/menu.dart';
import 'package:netflixclone/pages/root.dart';
import 'package:netflixclone/JSON/movie.dart';

class Upcoming extends StatefulWidget {
  @override
  upcomingState createState() => upcomingState();
}

class upcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, resizeToAvoidBottomInset: false, body: getBody());
  }

  Widget getBody() {
    //var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          width: 35,
                          fit: BoxFit.cover,
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RootApp()),
                                );
                                print("home clicked");
                              },
                            ), //Icon button
                            IconButton(
                                icon: Icon(
                                  Icons.account_circle,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                onPressed: null), //Icon button
                          ],
                        ), // inner row
                      ],
                    ), //row
                  ), //padding

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 18,
                            left: 4,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Upcoming Movies",
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ), //Row
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 18,
                      ),
                      child: Column(
                          children: List.generate(movie.length, (index) {
                        return InkWell(
                          onTap: () {
                            print("container clicked $index");
                          },
                          child: new Container(
                            decoration: BoxDecoration(color: Colors.black38),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                bottom: 20,
                              ),
                              child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(movie[index]["cover"]), fit: BoxFit.cover)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        movie[index]["titleimage"],
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.notifications,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => RootApp()),
                                              );
                                              print("home clicked");
                                            },
                                          ), //Icon button
                                          IconButton(
                                              icon: Icon(
                                                Icons.info_outline,
                                                color: Colors.white,
                                                size: 25,
                                              ),
                                              onPressed: null), //Icon button
                                        ],
                                      ), // inner row
                                    ],
                                  ), //row
                                ), //padding
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                    left: 8,
                                    right: 8,
                                  ),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    Text(movie[index]["title"],
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ]),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                    left: 8,
                                    right: 8,
                                  ),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    Text("Movie Title Movie Title Movie Title Movie Title Movie TitleMovie Title Movie Title Movie Title Movie Title Movie Title Movie Title Movie Title  Movie Title Movie Title  Movie Title Movie Title  Movie Title Movie Title  Movie Title Movie Title",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        )),
                                  ]),
                                ),
                              ]),
                            ),
                            //height: 100,
                          ),
                        ); //InkWell
                      }) //list
                          ), //row
                    ),
                  ), //scroll view
                ], //children
              ), //col
            ),
          ), //container
        ],
      )), //Stack //SingleChildScrolview
    ); //padding
  }
}
