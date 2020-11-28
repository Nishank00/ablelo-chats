import 'package:ablelo_chat/Services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpEnter extends StatefulWidget {
 
  @override
  _OtpEnterState createState() => _OtpEnterState();
}

class _OtpEnterState extends State<OtpEnter> {

  AuthServices _authServices = AuthServices();

  String otp = '';

  void _onKeyboardTap(String value) {
    setState(() {
      otp = otp + value;
    });
  }


  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.0),
            borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
        child: Center(child: Text(otp[position], style: TextStyle(color: Colors.black, fontSize: 18.0),)),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 22,),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                elevation: 0,
                backgroundColor: Colors.white,
                brightness: Brightness.light,
              ),
              body: _authServices.isOtpLoading ? Center(child: CircularProgressIndicator()) : SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Text('Enter 6 digits verification code sent to your number', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w500))
                                ),
                                Container(
                                  constraints: const BoxConstraints(
                                      maxWidth: 500
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      otpNumberWidget(0),
                                      otpNumberWidget(1),
                                      otpNumberWidget(2),
                                      otpNumberWidget(3),
                                      otpNumberWidget(4),
                                      otpNumberWidget(5),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            constraints: const BoxConstraints(
                                maxWidth: 500
                            ),
                            child: RaisedButton(
                              onPressed: () {
                                //TODO OTP LOGIN METHOD HERE
                                _authServices.validateOtpAndLogin(context, otp);
                              },
                              color: Colors.lightBlueAccent,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14))
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Confirm', style: TextStyle(color: Colors.white),),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                                         color: Colors.lightBlueAccent,
                                      ),
                                      child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16,),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          NumericKeyboard(
                            onKeyboardTap: _onKeyboardTap,
                            textColor: Colors.black,
                            rightIcon: Icon(
                              Icons.backspace,
                              color: Colors.black,
                            ),
                            rightButtonFn: () {
                              setState(() {
                                otp = otp.substring(0, otp.length - 1);
                              });
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
  }
}