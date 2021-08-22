import 'package:flutter/material.dart';
import 'package:meatwow/screens/order_success.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
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
                Padding(
                  padding: const EdgeInsets.only(
                    left: 28,
                    top: 25,
                    bottom: 18,
                  ),
                  child: Text(
                    "Order ID : xdarkvu",
                    style: TextStyle(
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Color.fromRGBO(8, 50, 81, 1),
                    ),
                  ),
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
                  height: 44,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 28,
                  ),
                  child: Text(
                    "Payment Mode",
                    style: TextStyle(
                      fontFamily: "Mulish",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(8, 50, 81, 1),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 26,
                        left: 28,
                      ),
                      child: Text(
                        "Cash on delivery",
                        style: TextStyle(
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color.fromRGBO(117, 116, 116, 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40, top: 26),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.check_box_outlined,
                          size: 24,
                        ),
                        color: Color.fromRGBO(8, 50, 81, 1),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 22,
                        left: 28,
                      ),
                      child: Text(
                        "Pay with card",
                        style: TextStyle(
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color.fromRGBO(117, 116, 116, 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40, top: 22),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.check_box_outline_blank_outlined,
                          size: 24,
                        ),
                        color: Color.fromRGBO(8, 50, 81, 1),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 194,
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
                    MaterialPageRoute(builder: (context) => OrderSuccess()));
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
                  "Place Order",
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
