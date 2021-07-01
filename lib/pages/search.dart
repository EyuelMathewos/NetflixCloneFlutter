import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:netflixclone/JSON/menu.dart';
import 'package:netflixclone/pages/root.dart';
import 'package:video_player/video_player.dart';
import 'package:netflixclone/JSON/movie.dart';
import 'package:netflixclone/pages/watch.dart';

class Search extends StatefulWidget {
  @override
  searchState createState() => searchState();
}

class searchState extends State<Search> {
  TextEditingController _controller;
  List movieSearchList;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    movieSearchList = movie;
  }

  List filtter(String value) {
    // ValueNotifier<List<Map>> searchedList = ValueNotifier<List<Map>>([]);
    List searchedList;
    print(value);
    List.generate(movieSearchList.length, (index) {
      print("********List values ${movieSearchList[index]['title']}");
      if (movieSearchList[index]['title'].toLowerCase().contains(value.toLowerCase())) {
        searchedList.add(movieSearchList[index]);
        print("true");
        print(searchedList['0']);
      }
    });
    return [
      {}
    ];
  }

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
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 15,
                    ),
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        height: 2.0,
                      ),
                      decoration: InputDecoration(
                          fillColor: Colors.black26,
                          filled: true,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          )),
                      onChanged: (text) {
                        print('First text field: $text');
                        //print(movieSearchList);
                        filtter(text);
                      },
                      onSubmitted: (String value) async {
                        await showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Thanks!'),
                              content: Text('You typed "$value", which has length ${value.characters.length}.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),

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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Watch(urllink: [
                                        movie[index]
                                      ])),
                            );
                            print("container clicked $index");
                          },
                          child: new Container(
                            decoration: BoxDecoration(color: Colors.black38),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 0,
                                bottom: 15,
                              ),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Column(children: [
                                  Image.asset(
                                    movie[index]["cover"],
                                    width: 150,
                                    height: 80,
                                  )
                                ]),
                                Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      top: 0,
                                    ),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Text(movie[index]["title"],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          )),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 4,
                                          //left: 8,
                                          //right: 8,
                                        ),
                                        child: Container(
                                          width: 190,
                                          child: Text(movie[index]["about"],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8,
                                              )),
                                        ),
                                      ),
                                      Text("2016 | +11 | 2016 | Action",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          )),
                                    ]),
                                  )
                                ]),
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
