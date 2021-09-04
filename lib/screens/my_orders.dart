import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key key}) : super(key: key);

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Orders",
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
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 27),
              child: Text(
                "Post Orders",
                style: TextStyle(
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color.fromRGBO(
                    163,
                    18,
                    28,
                    1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Container(
                height: 144,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: Color.fromRGBO(221, 221, 221, 1),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 13,
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
                        left: 15,
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
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 18),
                      child: SizedBox(
                        height: 1.5,
                        child: Container(
                          color: Color.fromRGBO(221, 221, 221, 1),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 0),
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
                                left: 15,
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
                          padding: const EdgeInsets.only(right: 24, top: 0),
                          child: Text(
                            "\u{20B9}${219}",
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(163, 18, 28, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
              ),
              child: Container(
                height: 204,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: Color.fromRGBO(221, 221, 221, 1),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 13,
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
                        left: 15,
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
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 18),
                      child: SizedBox(
                        height: 1.5,
                        child: Container(
                          color: Color.fromRGBO(221, 221, 221, 1),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 0),
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
                                left: 15,
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
                          padding: const EdgeInsets.only(right: 24, top: 0),
                          child: Text(
                            "\u{20B9}${219}",
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(163, 18, 28, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 0),
                              child: Text(
                                "Chicken lollipop",
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
                                left: 15,
                              ),
                              child: Text(
                                "pcs: 6",
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
                          padding: const EdgeInsets.only(right: 24, top: 0),
                          child: Text(
                            "\u{20B9}${249}",
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(163, 18, 28, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
