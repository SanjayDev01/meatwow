import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meatwow/config/uri.dart';
import 'package:meatwow/models/user.dart';
import 'package:meatwow/screens/login_screen.dart';
import 'package:meatwow/screens/my_address.dart';
import 'package:meatwow/screens/my_orders.dart';
import 'package:http/http.dart' as htt;
import 'package:meatwow/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  void _handleSignOut(context) async {
    String apiUrl = Ur().uri;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String refToken = prefs.getString("c_refToken");
    String token = prefs.getString("c_access_token");
    print(refToken);
    print(token);
    Uri ur = Uri.parse('$apiUrl/auth/signout');
    var resSignout = await htt.get(ur, headers: {
      "Content-Type": "application/json",
      "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg",
      "Cookie": "c_refToken=$refToken;c_access_token=$token",
    });
    print(resSignout.statusCode);
    var signOut = SignOut.fromJson(json.decode(resSignout.body));

    if (signOut.msg) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove("c_refToken");
      prefs.remove("c_access_token");
      print("Cookies Deleted");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Account",
          style: TextStyle(
            fontFamily: "Mulish",
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(8, 50, 81, 1),
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        elevation: 4.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          color: Color.fromRGBO(8, 50, 81, 1),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.account_circle,
                      color: Color.fromRGBO(205, 205, 205, 1),
                      size: 75,
                    ),
                    radius: 35,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kareem Khan",
                      style: TextStyle(
                        color: Color.fromRGBO(
                          8,
                          50,
                          81,
                          1,
                        ),
                        fontFamily: "Mulish",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "john@gmail.com",
                      style: TextStyle(
                        color: Color.fromRGBO(
                          117,
                          116,
                          116,
                          1,
                        ),
                        fontFamily: "Mulish",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "+919022333272",
                      style: TextStyle(
                        color: Color.fromRGBO(
                          117,
                          116,
                          116,
                          1,
                        ),
                        fontFamily: "Mulish",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 1.5,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Color.fromRGBO(221, 221, 221, 1),
              ),
            ),
            SizedBox(
              height: 43,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Icon(
                    Icons.shopping_basket,
                    color: Color.fromRGBO(
                      163,
                      18,
                      28,
                      1,
                    ),
                    size: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 160),
                  child: Text(
                    "My orders",
                    style: TextStyle(
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(163, 18, 28, 1),
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 44,
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyOrders()));
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 22,
                        color: Color.fromRGBO(174, 174, 174, 1),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 43,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Icon(
                    Icons.home,
                    color: Color.fromRGBO(
                      163,
                      18,
                      28,
                      1,
                    ),
                    size: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 160),
                  child: Text(
                    "Address",
                    style: TextStyle(
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(163, 18, 28, 1),
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 44,
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyAddress()));
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 22,
                        color: Color.fromRGBO(174, 174, 174, 1),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 46,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Icon(
                    Icons.exit_to_app,
                    color: Color.fromRGBO(
                      163,
                      18,
                      28,
                      1,
                    ),
                    size: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: GestureDetector(
                    onTap: () => _handleSignOut(context),
                    child: Text(
                      "Sign out",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(163, 18, 28, 1),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
