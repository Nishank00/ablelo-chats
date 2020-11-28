import 'package:ablelo_chat/Screens/home_page.dart';
import 'package:ablelo_chat/Screens/otp_enter.dart';
import 'package:ablelo_chat/Screens/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices{

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User firebaseUser;


  bool isLoginLoading = false;
  bool isOtpLoading = false;

  String actualCode;


  Future<bool> isUserAlreadyAuthenticated() async {
    firebaseUser =  _auth.currentUser;
    if(firebaseUser != null) {
      return true;
    } else {
      return false;
    }
  }


  Future<void> signIn(String otp, String verificationId) async {
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    ));
  }

  Future<void> verifyPhoneNumber(BuildContext context, String phoneNumber) async {
    //Make the page load
    isLoginLoading = true;

    await _auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber",
      timeout: const Duration(seconds: 60),
      verificationCompleted: (AuthCredential authCredential) async {
        await _auth
          .signInWithCredential(authCredential)
          .then((UserCredential value) {
            if(value != null && value.user != null) {
              print("Authentication Successful");
              onAuthenticationSuccessful(context, value);
            } else {
              Fluttertoast.showToast(
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                msg: 'Invalid Code!'
              );
            }
          }).catchError((e) {
            Fluttertoast.showToast(
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                msg: 'Something went wrong please try later!'
              );
          });
      },
      verificationFailed: (FirebaseAuthException authException) {
        print("Error message: " + authException.message);
        Fluttertoast.showToast(
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                msg: 'The phone number format is incorrect!'
              );
        isLoginLoading = false;
      },
      codeSent: (String verificationId, [int forceResendToken]) async { 
        actualCode = verificationId;
        print(actualCode);
        isLoginLoading = false;
        await Navigator.of(context).push(MaterialPageRoute(builder: (_) => OtpEnter()));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        actualCode = verificationId;
      }
    );
  }

  
  Future<void> validateOtpAndLogin(BuildContext context, String smsCode) async {
    isOtpLoading = true;
    final AuthCredential _authCredential = PhoneAuthProvider.credential(verificationId: actualCode, smsCode: smsCode);

    await _auth.signInWithCredential(_authCredential).catchError((e){
      print("Error: " + e.toString());
      isOtpLoading = false;
      Fluttertoast.showToast(
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                msg: 'Wrong Code'
              );
    }).then((UserCredential result) {
      if(result != null && result.user != null) {
        print("Authentication Successful");
        Fluttertoast.showToast(
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                msg: 'Authentication Successful!'
              );
        onAuthenticationSuccessful(context, result);
      }
    });
  }

  Future<void> onAuthenticationSuccessful(BuildContext context, UserCredential result) async {
    isLoginLoading = true;
    isOtpLoading = true;

    firebaseUser = result.user;
    print(firebaseUser);
    print(firebaseUser.uid);

    redirectUser(context, firebaseUser);
  }

  void redirectUser(BuildContext context, User firebaseUser) async {
    final snapShot = await _firestore
      .collection("users")
      .doc(firebaseUser.uid)
      .get();
      String snap = snapShot.toString();
      print(snap);
      print(snapShot);
      if(snapShot == null || !snapShot.exists) {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignupPage()));
      } else {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
      }
  }

}