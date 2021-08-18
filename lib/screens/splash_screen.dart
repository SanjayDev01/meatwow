import 'package:flutter/material.dart';
import 'package:meatwow/screens/signup_screen.dart';
import 'dart:async';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignUpScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/meat-wow-logo.png"),
                height: 53,
                width: 201,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Fresh Meat Everyday",
                style: TextStyle(
                  fontFamily: "Mulish",
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(
                height: 333,
              ),
              CircularProgressIndicator(
                color: Color.fromRGBO(163, 18, 28, 1),
                strokeWidth: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
