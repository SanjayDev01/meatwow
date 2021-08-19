import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController textEditingController = TextEditingController();

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
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
                                  text: "+91-9022900345",
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
                          cursorColor: Colors.white,
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                          cursorWidth: 2.0,
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
                              currentText = value;
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
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
