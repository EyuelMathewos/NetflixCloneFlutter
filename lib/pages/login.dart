import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:netflixclone/JSON/menu.dart';
import 'package:netflixclone/pages/root.dart';
import 'package:video_player/video_player.dart';
import 'package:netflixclone/JSON/movie.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

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
      padding: EdgeInsets.only(bottom: 0),
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
            height: 500,
            width: size.width - 20,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.85)),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Login",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
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
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              )),
                          style: TextStyle(color: Colors.white),
                        ),
                        TextFormField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Colors.black26,
                                filled: true,
                                hintText: 'password',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ))),
                        SizedBox(
                          height: 8,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: size.width - 40, height: 40),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // background color
                              primary: Colors.red,

                              textStyle: TextStyle(fontSize: 15),
                            ),
                            child: Text('Sign In',
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              print('Button clicked!');

                            },
                          ),
                        ),
                      ],
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
