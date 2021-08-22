import 'package:flutter/material.dart';

class MyAddress extends StatefulWidget {
  const MyAddress({Key? key}) : super(key: key);

  @override
  _MyAddressState createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Address",
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
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "My Address",
                    style: TextStyle(
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color.fromRGBO(163, 18, 28, 1),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(
                      "Add New",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: Color.fromRGBO(163, 18, 28, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: Container(
                height: 134,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: Color.fromRGBO(
                        221,
                        221,
                        221,
                        1,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, top: 14),
                      child: Text(
                        "Kareem Khan",
                        style: TextStyle(
                          fontFamily: "Mulish",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(8, 50, 81, 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 10,
                      ),
                      child: Text(
                        "Flat no. 1203, rock Avenue plot D, Hindustan Naka, Kandivali West, Kandivali West",
                        style: TextStyle(
                          fontFamily: "Mulish",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(117, 116, 116, 1),
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 12,
                              right: 18,
                            ),
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color.fromRGBO(163, 18, 28, 1),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 12,
                              right: 24,
                            ),
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color.fromRGBO(163, 18, 28, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
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
