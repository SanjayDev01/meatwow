import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meatwow/models/signIn_model.dart';
import 'package:meatwow/models/user.dart';
import 'package:meatwow/screens/signup_screen.dart';
import 'package:meatwow/services/signIn_api.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SignInRequest signInRequest;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool msg;

  @override
  void initState() {
    super.initState();
    signInRequest = SignInRequest();
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  apiCall2() {
    SignInAPIService signInAPIService = SignInAPIService();
    signInAPIService.signIn(signInRequest).then((value) {
      if (value.msg) {
        setState(() {
          msg = value.msg;
          msg
              ? Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()))
              : Text("");
        });
        final data = value.user as User;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: globalFormKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      87,
                      83,
                      87,
                      0,
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage("assets/images/meat-wow-logo.png"),
                        height: 53,
                        width: 201,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 117.07,
                  ),
                  Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: "Mulish",
                          fontSize: 25.11,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          color: Color.fromRGBO(163, 18, 28, 1)),
                    ),
                  ),
                  SizedBox(
                    height: 58.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      51.07,
                      18,
                      238.56,
                      11.72,
                    ),
                    child: Text(
                      "Mobile Number",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Color.fromRGBO(53, 53, 53, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      36.84,
                      0,
                      36.84,
                      0,
                    ),
                    child: Container(
                      // height: 42,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.phone,
                        onSaved: (input) {
                          setState(() {
                            signInRequest.phoneNumber = input;
                          });
                        },
                        validator: (input) => input.length < 10
                            ? "Phone Number should be equal to 10 digits"
                            : null,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefix: Text("    "),
                            hintText: "Phone",
                            hintStyle: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(175, 175, 175, 1),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      51.07,
                      18,
                      238.56,
                      11.72,
                    ),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Color.fromRGBO(53, 53, 53, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      36.84,
                      0,
                      36.84,
                      0,
                    ),
                    child: Container(
                      //  height: 42,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.text,
                        onSaved: (input) {
                          setState(() {
                            signInRequest.password = input;
                          });
                        },
                        validator: (input) => input.length < 3
                            ? "Password should be more than 3 characters"
                            : null,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefix: Text("    "),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(175, 175, 175, 1),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      271.1,
                      9.55,
                      38.84,
                      11.72,
                    ),
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Color.fromRGBO(117, 116, 116, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(36.84, 22.6, 36.84, 0),
                    child: Container(
                      width: 380.32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.18)),
                      height: 37.66,
                      child: FlatButton(
                        onPressed: () {
                          if (validateAndSave()) {
                            apiCall2();
                          }
                        },
                        child: Text(
                          "Login",
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
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SignUpScreen())),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Color.fromRGBO(
                                163,
                                18,
                                28,
                                1,
                              ),
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
