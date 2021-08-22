import 'package:flutter/material.dart';
import 'package:meatwow/screens/home_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  showBottomOption(context) {
    return showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 273,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    top: 21,
                  ),
                  child: Text(
                    "Order cancellation",
                    style: TextStyle(
                      fontFamily: "Mulish",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(53, 53, 53, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: SizedBox(
                    height: 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      color: Color.fromRGBO(221, 221, 221, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: Text(
                    "Are you sure?",
                    style: TextStyle(
                      fontFamily: "Mulish",
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(163, 18, 28, 1),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "you want to cancel this order",
                    style: TextStyle(
                      fontFamily: "Mulish",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(117, 116, 116, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 49,
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                255,
                                255,
                                255,
                                1,
                              ),
                              borderRadius: BorderRadius.circular(1.92),
                              border: Border.all(
                                  width: 1.5,
                                  color: Color.fromRGBO(117, 116, 116, 1))),
                          width: 143,
                          height: 45,
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(18, 7, 17, 6),
                          child: Text(
                            "Yes",
                            style: TextStyle(
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color.fromRGBO(
                                  0,
                                  0,
                                  0,
                                  1,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 49,
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                              163,
                              18,
                              28,
                              1,
                            ),
                            borderRadius: BorderRadius.circular(1.92),
                          ),
                          width: 143,
                          height: 45,
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(18, 7, 17, 6),
                          child: Text(
                            "Don’t Cancel",
                            style: TextStyle(
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color.fromRGBO(
                                  255,
                                  255,
                                  255,
                                  1,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Details",
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
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 28,
                            top: 25,
                            bottom: 0,
                          ),
                          child: Text(
                            "Order ID : xdarkvu",
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color.fromRGBO(8, 50, 81, 1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 28,
                            top: 4,
                            bottom: 0,
                          ),
                          child: Text(
                            "Feb 24, 2021 03:11 PM",
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color.fromRGBO(117, 116, 116, 1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 28,
                            top: 4,
                            bottom: 0,
                          ),
                          child: Text(
                            "Payment mode: Cash on delivery",
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color.fromRGBO(117, 116, 116, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 28,
                      ),
                      child: TextButton(
                        onPressed: () {
                          showBottomOption(context);
                        },
                        child: Text(
                          "Cancel order",
                          style: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            color: Color.fromRGBO(163, 18, 28, 1),
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 23,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 168,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(
                          221,
                          221,
                          221,
                          1,
                        ),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 16.5),
                                  child: Text(
                                    "Chicken Breast",
                                    style: TextStyle(
                                      fontFamily: "Mulish",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(8, 50, 81, 1),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                  ),
                                  child: Text(
                                    "Net wt: 500gm",
                                    style: TextStyle(
                                      fontFamily: "Mulish",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(117, 116, 116, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, top: 14),
                              child: Text(
                                "\u{20B9}${219}",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(163, 18, 28, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 15),
                              child: Text(
                                "Discount",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(117, 116, 116, 1),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, top: 15),
                              child: Text(
                                "- \u{20B9}${20}",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(117, 116, 116, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                          child: SizedBox(
                            height: 1.5,
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              color: Color.fromRGBO(221, 221, 221, 1),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 16),
                              child: Text(
                                "Grand Total",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(8, 50, 81, 1),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, bottom: 16),
                              child: Text(
                                "\u{20B9}${199}",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(8, 50, 81, 1),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(
                    "Shipping address",
                    style: TextStyle(
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color.fromRGBO(8, 50, 81, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35, top: 6),
                  child: Text(
                    "Flat no. 1203, rock Avenue plot D, Hindustan Naka, Kandivali West, Kandivali West",
                    style: TextStyle(
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color.fromRGBO(117, 116, 116, 1),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 7),
                  child: Text(
                    "Pin: 400089",
                    style: TextStyle(
                      fontFamily: "Mulish",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(117, 116, 116, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 4),
                  child: Text(
                    "Contact: 902255559",
                    style: TextStyle(
                      fontFamily: "Mulish",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(117, 116, 116, 1),
                    ),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                height: 54,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                color: Color.fromRGBO(
                  163,
                  18,
                  28,
                  1,
                ),
                child: Text(
                  "go to home",
                  style: TextStyle(
                    color: Color.fromRGBO(
                      255,
                      255,
                      255,
                      1,
                    ),
                    fontSize: 18,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
          alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
