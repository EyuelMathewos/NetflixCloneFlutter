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
            image: DecorationImage(image: AssetImage("assets/images/assassinscreedcover.jpg"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        Center(
          child: Container(
            height: 300,
            width: size.width - 20,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.black26,
                          filled: true,
                          hintText: 'email or phone number',
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
                            borderSide: BorderSide(color: Colors.orange),
                          ))),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
