import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meatwow/screens/otp_screen.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          height: MediaQuery.of(context).size.height,
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
                    height: 42,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.phone,
                      textAlignVertical: TextAlignVertical.bottom,
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
                    height: 42,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      textAlignVertical: TextAlignVertical.bottom,
                      keyboardType: TextInputType.text,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
