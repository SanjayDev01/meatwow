import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meatwow/models/user.dart';
import 'package:meatwow/models/verify.dart';
import 'package:meatwow/services/verify_api_service.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'home_screen.dart';
import 'login_screen.dart';

class OTPScreen extends StatefulWidget {
  final String otpId;
  final String phoneNumber;
  const OTPScreen({
    Key key,
    this.otpId,
    this.phoneNumber,
  }) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState(
        otpId: otpId,
        phoneNumber: phoneNumber,
      );
}

class _OTPScreenState extends State<OTPScreen> {
  final String otpId;
  final String phoneNumber;
  VerifyRequest verifyRequest;
  bool msg;

  String otpPin;
  _OTPScreenState({
    this.otpId,
    this.phoneNumber,
  });
  TextEditingController textEditingController = TextEditingController();

  // ignore: close_sinks
  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
    verifyRequest = VerifyRequest();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  // signUp(String otpId, String otpPin, String phoneNumber) async {
  //   Map data = {
  //     "phoneNumber": phoneNumber,
  //     "otp": otpPin,
  //     "otpId": otpId,
  //   };

  //   var jsonData = null;

  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   Uri uri = Uri.http('localhost:5000', '/auth/check-otp-and-signin');

  //   var response = await http.post(
  //     uri,
  //     body: jsonEncode(data),
  //     headers: {
  //       "Content-Type": "application/json",
  //       "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg"
  //     },
  //   );

  //   if (response.body.isNotEmpty) {
  //     jsonData = json.decode(response.body);
  //     print(jsonData.toString());
  //     setState(() {
  //       sharedPreferences.setString("username", jsonData["username"]);
  //     });
  //     if (sharedPreferences.getString("username") != null) {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => LoginScreen()));
  //     } else {
  //       print(response.body);
  //     }
  //   } else {
  //     print("response is empty Failed");
  //   }
  // }

  apiCall1() {
    VerifyAPIService apiService1 = VerifyAPIService();

    apiService1.signUp(verifyRequest).then((value) async {
      if (value.msg) {
        //print(value.msg);

        setState(() {
          msg = value.msg;
          msg
              ? Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()))
              : Text("");
        });

        final data = value.user as User;

        // print(data.isPhoneVerified);
        // final SharedPreferences prefs = await SharedPreferences.getInstance();
        // bool result =
        //     await prefs.setString('user', json.encode(data.toString()));
        // print(result);
      } else {
        print(value);
      }
    });
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Color.fromRGBO(255, 255, 255, 1),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(121, 64, 117, 0),
                      child: Text(
                        "OTP Verification",
                        style: TextStyle(
                          fontFamily: "Mulish",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: Color.fromRGBO(8, 50, 81, 1),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        58,
                        75.88,
                        58,
                        27.88,
                      ),
                      child: RichText(
                        text: TextSpan(
                            text: "Enter the OTP Sent to ",
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Color(0xfbb757474),
                            ),
                            children: [
                              TextSpan(
                                  text: "+91-$phoneNumber",
                                  style: TextStyle(
                                    fontFamily: "Mulish",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(8, 50, 81, 1),
                                  ))
                            ]),
                      ),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 0.0,
                        horizontal: 44.16,
                      ),
                      child: PinCodeTextField(
                          appContext: context,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 47,
                            borderWidth: 0.0,
                            fieldWidth: 39,
                            activeFillColor: Colors.white,
                          ),
                          animationType: AnimationType.fade,
                          pastedTextStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Nunito",
                            fontSize: 18,
                          ),
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          keyboardType: TextInputType.number,
                          //validator: (input) =>
                          //    input.length = 6 ? "OTP is invalid" : null,
                          cursorColor: Colors.white,
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                          cursorWidth: 2.0,
                          onSaved: (input) {
                            setState(() {
                              verifyRequest.otp = input;
                            });
                          },
                          cursorHeight: 20,
                          boxShadows: [
                            BoxShadow(
                              //offset: Offset(0, 1),
                              color: Color.fromRGBO(163, 18, 28, 1),
                              //blurRadius: 10,
                            )
                          ],
                          length: 6,
                          onChanged: (value) {
                            setState(() {
                              verifyRequest.otp = value;
                              otpPin = value;
                              verifyRequest.otpId = otpId;
                              verifyRequest.phoneNumber = phoneNumber;
                            });
                          }),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        58,
                        208.9,
                        58,
                        0,
                      ),
                      child: RichText(
                        text: TextSpan(
                            text: "Didn't recieve code? ",
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Color(0xfbb757474),
                            ),
                            children: [
                              TextSpan(
                                  text: "Resend",
                                  style: TextStyle(
                                    fontFamily: "Mulish",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(8, 50, 81, 1),
                                  ))
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(36.84, 16.91, 36.84, 0),
                    child: Container(
                      width: 380.32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.18)),
                      height: 37.66,
                      child: FlatButton(
                        onPressed: () {
                          //signUp(otpId, otpPin, phoneNumber);
                          print(otpId);
                          print(phoneNumber);
                          print(otpPin);
                          apiCall1();
                        },
                        child: Text(
                          "Verify",
                          style: TextStyle(
                            fontFamily: "Mulish",
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(
                              255,
                              255,
                              255,
                              1,
                            ),
                          ),
                        ),
                        color: Color.fromRGBO(
                          163,
                          18,
                          28,
                          1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
