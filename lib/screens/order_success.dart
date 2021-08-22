import 'dart:async';

import 'package:flutter/material.dart';

import 'order_screen.dart';

class OrderSuccess extends StatefulWidget {
  @override
  _OrderSuccessState createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OrderScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.task_alt_outlined,
                size: 78,
                color: Color.fromRGBO(68, 166, 73, 1),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Thank You!",
                style: TextStyle(
                  color: Color.fromRGBO(
                    68,
                    166,
                    73,
                    1,
                  ),
                  fontFamily: "Mulish",
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Your order has been received.",
                style: TextStyle(
                  color: Color.fromRGBO(
                    68,
                    166,
                    73,
                    1,
                  ),
                  fontFamily: "Mulish",
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )),
    );
  }
}
