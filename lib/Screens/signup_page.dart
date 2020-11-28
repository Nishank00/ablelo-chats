import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {


  Widget _buildPageContent(BuildContext context) {
    return Container(
      color: Color(0xffb4d4c0),
      child: ListView(
        children: <Widget>[
          SizedBox(height: 30.0,),
          //CircleAvatar(child: PNetworkImage(origami), maxRadius: 50, backgroundColor: Colors.transparent,),
          SizedBox(height: 20.0,),
          _buildLoginForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FloatingActionButton(
                mini: true,
                onPressed: (){
                  Navigator.pop(context);
                },
                backgroundColor: Color(0xff3f7b82),
                child: Icon(Icons.arrow_back),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _buildLoginForm() {
    return Container(
          padding: EdgeInsets.all(20.0),
          child: Stack(
            children: <Widget>[
              ClipPath(
                clipper: RoundedDiagonalPathClipper(),
                child: Container(
                  height: 400,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 90.0,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          style: TextStyle(color: Color(0xff3f7b82)),
                          decoration: InputDecoration(
                            hintText: "Email address",
                            hintStyle: TextStyle(color: Color(0xff3f7b82)),
                            border: InputBorder.none,
                            icon: Icon(Icons.email, color: Color(0xff3f7b82),)
                          ),
                        )
                      ),
                      Container(child: Divider(color: Colors.blue.shade400,), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          style: TextStyle(color: Color(0xff3f7b82)),
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Color(0xff3f7b82)),
                            border: InputBorder.none,
                            icon: Icon(Icons.lock, color: Color(0xff3f7b82),)
                          ),
                        )
                      ),
                      Container(child: Divider(color: Colors.blue.shade400,), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          style: TextStyle(color: Color(0xff3f7b82)),
                          decoration: InputDecoration(
                            hintText: "Confirm password",
                            hintStyle: TextStyle(color: Color(0xff3f7b82)),
                            border: InputBorder.none,
                            icon: Icon(Icons.lock, color: Color(0xff3f7b82),)
                          ),
                        )
                      ),
                      Container(child: Divider(color: Colors.blue.shade400,), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                      SizedBox(height: 10.0,),
                      
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Color(0xff3f7b82),
                    child: Icon(Icons.person, color: Colors.white,),
                  ),
                ],
              ),
              Container(
                height: 420,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                    child: Text("Sign Up", style: TextStyle(color: Colors.white70)),
                    color: Color(0xff3f7b82),
                  ),
                ),
              )
            ],
          ),
        );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }
}