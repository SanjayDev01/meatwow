import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:meatwow/models/user.dart';
import 'package:meatwow/screens/home_screen.dart';
import 'package:meatwow/screens/login_screen.dart';
import 'package:meatwow/screens/signup_screen.dart';
import 'dart:async';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:shared_preferences/shared_preferences.dart';

dynamic userObject;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool firstLogin = true;

  getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> userMap;
    final String userStr = prefs.getString('c_access_token');
    if (userStr != null) {
      print(userStr);
      userMap = JwtDecoder.decode(userStr);
      //  print(userMap["id"]);
      userObject = userMap;
      print(userObject["id"]);
    }

    if (userMap != null) {
      //final User user = User.fromJson(userMap);
      setState(() {
        firstLogin = false;
      });
    }
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return firstLogin ? LoginScreen() : HomeScreen();
            })));
  }

  @override
  initState() {
    super.initState();
    getUserInfo();
    // Timer(
    //     Duration(seconds: 2),
    //     () => Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => SignUpScreen())));
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
              //Text("$longitude & $latitude"),
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
