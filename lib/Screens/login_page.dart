import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phoneNumber;
  String verificationId;
  String otp;
  String authStatus = '';

  Future<void> verifyPhoneNumber(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 30),
        verificationCompleted: (AuthCredential authCredential) {
          setState(() {
            authStatus = 'Your phone number is successfully verified';
          });
        },
        verificationFailed: (FirebaseAuthException authException) {
          setState(() {
            authStatus = 'Authentication Failed';
          });
        },
        codeSent: (String verId, [int forceCodeResent]) {
          verificationId = verId;
          setState(() {
            authStatus = "OTP has been successfully sent";
          });
          otpDialogBox(context).then((value) {});
        },
        codeAutoRetrievalTimeout: (String verId) {
          verificationId = verId;
          setState(() {
            authStatus = 'TIMED OUT';
          });
        });
  }

  otpDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Enter your 6 Digit OTP"),
            content: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                )),
                onChanged: (String value) {
                  otp = value;
                },
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  signIn(otp);
                },
                child: Text("Submit"),
              ),
            ],
          );
        });
  }

  Future<void> signIn(String otp) async {
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Text("OTP Authentication"),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.phone_iphone,
                    color: Colors.white24,
                  ),
                  hintStyle: TextStyle(color: Colors.grey.shade800),
                  hintText: 'Enter your phone number',
                  fillColor: Colors.white70,
                ),
                onChanged: (value) {
                  phoneNumber = value;
                },
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () =>
                  phoneNumber == null ? null : verifyPhoneNumber(context),
              child: Text(
                "Generate OTP",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
