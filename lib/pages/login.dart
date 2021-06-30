import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:netflixclone/JSON/menu.dart';
import 'package:netflixclone/pages/root.dart';
import 'package:video_player/video_player.dart';
import 'package:netflixclone/JSON/movie.dart';

class Login extends StatefulWidget {
  @override
  loginState createState() => loginState();
}

class loginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, resizeToAvoidBottomInset: false, body: getBody());
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(children: [
        Container(
          width: 150,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/banner.webp"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ]),
    );
  }
}
