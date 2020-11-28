import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Sign Up",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 32.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15.0, bottom: 15.0)),
            Card(
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              elevation: 11,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black26,
                    ),
                    hintText: "Full name",
                    hintStyle: TextStyle(
                      color: Colors.black26,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15.0, bottom: 15.0)),
            Card(
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              elevation: 11,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black26,
                    ),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Colors.black26,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15.0, bottom: 15.0)),
            Card(
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              elevation: 11,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black26,
                    ),
                    hintText: "Username",
                    hintStyle: TextStyle(
                      color: Colors.black26,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
