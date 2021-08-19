import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meatwow/screens/otp_screen.dart';

class SignUpScreen extends StatelessWidget {
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
                    63,
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
                  height: 43.07,
                ),
                Center(
                  child: Text(
                    "Sign Up",
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
                    0,
                    238.56,
                    11.72,
                  ),
                  child: Text(
                    "Name",
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
                  child: CupertinoTextField(
                    placeholder: "Name",
                    placeholderStyle: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(175, 175, 175, 1),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Mulish",
                    ),
                    style: TextStyle(
                      fontSize: 11.72,
                      color: Color.fromRGBO(175, 175, 175, 1),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Mulish",
                    ),
                    keyboardType: TextInputType.phone,
                    padding: EdgeInsets.fromLTRB(21.76, 10.04, 209.25, 12.55),
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
                    "Email",
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
                  child: CupertinoTextField(
                    placeholder: "Email",
                    placeholderStyle: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(175, 175, 175, 1),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Mulish",
                    ),
                    style: TextStyle(
                      fontSize: 11.72,
                      color: Color.fromRGBO(175, 175, 175, 1),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Mulish",
                    ),
                    keyboardType: TextInputType.phone,
                    padding: EdgeInsets.fromLTRB(21.76, 10.04, 209.25, 12.55),
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
                  child: CupertinoTextField(
                    placeholder: "Phone",
                    placeholderStyle: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(175, 175, 175, 1),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Mulish",
                    ),
                    style: TextStyle(
                      fontSize: 11.72,
                      color: Color.fromRGBO(175, 175, 175, 1),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Mulish",
                    ),
                    keyboardType: TextInputType.phone,
                    padding: EdgeInsets.fromLTRB(21.76, 10.04, 209.25, 12.55),
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
                  child: CupertinoTextField(
                    placeholder: "Password",
                    placeholderStyle: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(175, 175, 175, 1),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Mulish",
                    ),
                    style: TextStyle(
                      fontSize: 11.72,
                      color: Color.fromRGBO(175, 175, 175, 1),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Mulish",
                    ),
                    keyboardType: TextInputType.phone,
                    padding: EdgeInsets.fromLTRB(21.76, 10.04, 209.25, 12.55),
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
                                builder: (context) => OTPScreen()));
                      },
                      child: Text(
                        "Get OTP",
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
                SizedBox(height: 47.24),
                Padding(
                  padding: const EdgeInsets.fromLTRB(33.93, 0, 33.93, 45.9),
                  child: Row(
                    children: [
                      Text(
                        "By signing in you agree to our",
                        style: TextStyle(
                          fontFamily: "Mulish",
                          fontSize: 12.35,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: Color(0xfbb757474),
                          letterSpacing: 1.0,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "terms and conditions",
                          style: TextStyle(
                            fontFamily: "Mulish",
                            fontSize: 12.35,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(163, 18, 28, 1),
                            letterSpacing: 1.0,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
