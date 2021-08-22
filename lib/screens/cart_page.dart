import 'package:flutter/material.dart';
import 'package:meatwow/screens/checkout.dart';

import 'address.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool validLocation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart",
          style: TextStyle(
              fontFamily: "Mulish",
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(
                8,
                50,
                81,
                1,
              )),
        ),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Color.fromRGBO(8, 50, 81, 1),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: SafeArea(
          child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              validLocation
                  ? Text("")
                  : Container(
                      height: 47,
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromRGBO(8, 50, 81, 1),
                      alignment: Alignment.center,
                      child: Text(
                        "Sorry we don’t deliver at your location",
                        style: TextStyle(
                            fontFamily: "Mulish",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(
                              255,
                              255,
                              255,
                              1,
                            )),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(13),
                child: Container(
                  height: 116,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Card(
                    elevation: 3.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 18,
                                  ),
                                  child: Text(
                                    "Chicken Breast",
                                    style: TextStyle(
                                        fontFamily: "Mulish",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(
                                          8,
                                          50,
                                          81,
                                          1,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 18,
                                  ),
                                  child: Text(
                                    "Net Wt: 500gm",
                                    style: TextStyle(
                                      color: Color.fromRGBO(117, 116, 116, 1),
                                      fontFamily: "Mulish",
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.close,
                                  )),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 4,
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.remove_circle_outline),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 11,
                                    right: 11,
                                  ),
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                      fontFamily: "Mulish",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(
                                        8,
                                        50,
                                        81,
                                        1,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 22),
                              child: Text(
                                "\u{20B9}${219}",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Color.fromRGBO(
                                    163,
                                    18,
                                    28,
                                    1,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 26,
                  top: 40,
                  bottom: 18,
                ),
                child: Text(
                  "have a coupon? apply",
                  style: TextStyle(
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(80, 80, 80, 1),
                    fontSize: 12,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 211,
                    height: 45,
                    alignment: Alignment.center,
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Coupon code",
                          hintStyle: TextStyle(
                            fontFamily: "Mulish",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(80, 80, 80, 1),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 18),
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
                        width: 120.85,
                        height: 45.44,
                        alignment: Alignment.center,
                        child: Text(
                          "Apply",
                          style: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
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
              ),
              SizedBox(
                height: 180,
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
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 10,
                        ),
                        child: Text(
                          "Card Details",
                          style: TextStyle(
                            fontFamily: "Mulish",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(8, 50, 81, 1),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 16),
                            child: Text(
                              "Subtotal",
                              style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(117, 116, 116, 1),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "\u{20B9}${219}",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 6),
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
                            padding: const EdgeInsets.only(right: 20),
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
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 18,
                      top: 37,
                      bottom: 40,
                    ),
                    child: Text(
                      "Shipping Address",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color.fromRGBO(117, 116, 116, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 15.0,
                      top: 30,
                      bottom: 33,
                    ),
                    child: GestureDetector(
                      child: Container(
                        width: 142,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 1.5,
                          color: Color.fromRGBO(163, 18, 28, 1),
                        )),
                        height: 40,
                        child: Text(
                          "+ Add Address",
                          style: TextStyle(
                            color: Color.fromRGBO(163, 18, 28, 1),
                            fontFamily: "Mulish",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddressPage(),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CheckoutPage()));
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
                "Proceed to Checkout",
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
        ]),
      )),
    );
  }
}
