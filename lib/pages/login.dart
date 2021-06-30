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
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Stack(children: [
        Container(
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/banner.webp"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        Center(
          child: Container(
            // height: 300,
            width: size.width - 20,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/banner.webp"), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ]),
    );
  }
}
