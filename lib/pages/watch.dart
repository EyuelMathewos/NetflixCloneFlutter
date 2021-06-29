import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:netflixclone/JSON/menu.dart';
import 'package:netflixclone/pages/root.dart';
import 'package:video_player/video_player.dart';

class Watch extends StatefulWidget {
  var urllink;
  Watch({Key key, this.urllink}) : super(key: key);
  @override
  watchState createState() => watchState();
}

class watchState extends State<Watch> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Create an store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://movieapiet.herokuapp.com/api/container/Movie/files/5ed36e35c80cb808ee742a2b',
    );

    _initializeVideoPlayerFuture = _controller.initialize().then((_) => setState(() {}));

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
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

                  Container(
                    height: 200,
                    child: VideoPlayer(_controller),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 4,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Movie Title",
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                              //2016 | +11 | 2016 | Action
                              Row(
                                children: [
                                  Text("New ",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text("2020 ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text("18+ ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text("Movie ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text("HD ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text("${widget.urllink}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
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
                          children: List.generate(6, (index) {
                        return InkWell(
                          onTap: () {
                            print("container clicked $index");
                          },
                          child: new Container(
                            decoration: BoxDecoration(color: Colors.black38),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                bottom: 4,
                              ),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Column(children: [
                                  Image.asset(
                                    "assets/images/search_1.jpg",
                                    width: 150,
                                    height: 80,
                                  )
                                ]),
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      top: 8,
                                    ),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Text("Indexed Movie Title",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          )),
                                      Text("About movie Detial",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          )),
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
