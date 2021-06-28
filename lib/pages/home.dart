import 'package:flutter/material.dart';
import 'package:netflixclone/pages/watch.dart';
import 'package:netflixclone/JSON/movie.json';
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  homePageState createState() => homePageState();
}

class homePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, backgroundColor: Colors.black, body: getBody());
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            //height: size.height - 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(
                    height: 500,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/banner.webp"), fit: BoxFit.cover)),
                  ), //container
                  Container(
                      height: 500,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Colors.black.withOpacity(0.85),
                        Colors.black.withOpacity(0),
                      ], begin: Alignment.bottomCenter, end: Alignment.topCenter)) //BoxDecoration
                      ), //container
                  Container(
                      height: 500,
                      width: size.width,
                      child: Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.center, children: [
                        Image.asset("assets/images/title_img.webp", width: 300),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Sci-Fi Adventure", style: TextStyle(fontSize: 11, color: Colors.white)),
                      ]) //col
                      ), //container
                ]), //stack
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  Column(
                    children: [
                      Icon(Icons.add, color: Colors.white, size: 25),
                      SizedBox(
                        height: 5,
                      ),
                      Text("My List",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ), //col
                  Column(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.play_arrow, color: Colors.white, size: 25),
                            Text('Play',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.info_outline, color: Colors.white, size: 25),
                      SizedBox(
                        height: 5,
                      ),
                      Text("info",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ), //col
                ]), //row

                SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text("My List",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ), //col
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Row(
                        children: List.generate(6, (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Watch()),
                          );
                          print("container clicked $index");
                        },
                        child: new Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Container(
                            width: 80,
                            height: 150,

                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/images/img_6.png"), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(6),
                            ), //boxed decoration
                          ),
                        ),
                      );
                    }) //list
                        ), //row
                  ),
                ), //scroll view
              ],
            ), //Col
          ),
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
                                  Icons.collections_bookmark,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                onPressed: null), //Icon button
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
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("TV Shows", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500)), //Text
                      Text("Movies", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500)), //Text
                      Row(children: [
                        Text("Catagory", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500)), //Text
                        SizedBox(
                          width: 3,
                        ),
                        Icon(Icons.keyboard_arrow_down, color: Colors.white),
                      ]) //inner row
                    ],
                  ), //row
                ], //children
              ), //col
            ),
          ), //container
        ],
      )), //Stack //SingleChildScrolview
    ); //padding
  }
}
