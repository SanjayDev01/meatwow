import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String assetName = 'assets/images/Sticky-chicken-category.svg';
  final String assetName1 = 'assets/images/Sticky-eggs-category.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Color.fromRGBO(255, 255, 255, 1),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 140.5,
                    color: Color.fromRGBO(
                      255,
                      255,
                      255,
                      1,
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(18, 18, 0, 0),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.menu,
                                  size: 24,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  83.26, 14.98, 83.27, 0),
                              child: Image.asset(
                                "assets/images/meat-wow-logo.png",
                                width: 112.44,
                                height: 30.04,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0, 15, 27.91, 0),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.shopping_cart_outlined,
                                    size: 24,
                                  )),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              27.91, 15.4, 27.91, 17.91),
                          child: CupertinoTextField(
                            prefix: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Icon(
                                Icons.search,
                                color: Color.fromRGBO(
                                  174,
                                  174,
                                  174,
                                  1,
                                ),
                                size: 22,
                              ),
                            ),
                            padding: EdgeInsets.fromLTRB(
                              17,
                              9.51,
                              142.04,
                              9.51,
                            ),
                            placeholder: "Example - chicken breast",
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.72),
                                border: Border.all(
                                    color: Color.fromRGBO(174, 174, 174, 1))),
                            placeholderStyle: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                              fontSize: 14.43,
                              color: Color.fromRGBO(
                                174,
                                174,
                                174,
                                1,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 78,
                    padding: EdgeInsets.fromLTRB(17.55, 17.67, 0, 17.8),
                    color: Color.fromRGBO(8, 50, 81, 1),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: 106,
                          height: 32,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white, width: 0.64),
                            borderRadius: BorderRadius.circular(3.72),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                assetName,
                              ),
                              Text(
                                "Chicken",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Container(
                          width: 106,
                          height: 32,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white, width: 0.64),
                            borderRadius: BorderRadius.circular(3.72),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                assetName1,
                              ),
                              Text(
                                "Eggs",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Container(
                          width: 106,
                          height: 32,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white, width: 0.64),
                            borderRadius: BorderRadius.circular(3.72),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                assetName1,
                              ),
                              Text(
                                "Eggs",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Container(
                          width: 106,
                          height: 32,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white, width: 0.64),
                            borderRadius: BorderRadius.circular(3.72),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                assetName1,
                              ),
                              Text(
                                "Eggs",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Container(
                          width: 106,
                          height: 32,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white, width: 0.64),
                            borderRadius: BorderRadius.circular(3.72),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                assetName1,
                              ),
                              Text(
                                "Eggs",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.5,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/Hero-Section.jpg",
                      scale: 0.5,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Stack(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
                          child: Container(
                            height: 86.74,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Delivered Fresh\nEveryday",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "100%\n Hygienic",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "Extraordinary\n Cooking",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromRGBO(
                                  196,
                                  196,
                                  196,
                                  1,
                                ),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(2.89),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 208,
                        height: 40,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(
                          "We Provide Best Meat",
                          style: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              color: Color.fromRGBO(
                                163,
                                18,
                                28,
                                1,
                              )),
                        ),
                      )
                    ],
                    alignment: Alignment.topCenter,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 19, 0, 12),
                    child: Text(
                      "Best Sellers",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: Color.fromRGBO(
                          53,
                          53,
                          53,
                          1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Container(
                    height: 266,
                    //width: 224.9,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 23.71,
                          ),
                          child: Card(
                            child: Container(
                              width: 185.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.21),
                              ),
                              height: 257.7,
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/Product-image.png"),
                                  ),
                                  Container(
                                    height: 78,
                                    width: 185.9,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 11),
                                                  child: Text(
                                                    "Chicken Breast",
                                                    style: TextStyle(
                                                        fontSize: 8.89,
                                                        fontFamily: "Mulish",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Color.fromRGBO(
                                                          53,
                                                          53,
                                                          53,
                                                          1,
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 11),
                                                  child: Text(
                                                    "Boneless",
                                                    style: TextStyle(
                                                        fontSize: 8.71,
                                                        fontFamily: "Mulish",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Color.fromRGBO(
                                                          117,
                                                          116,
                                                          116,
                                                          1,
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 3.4,
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {},
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                        163,
                                                        18,
                                                        28,
                                                        1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.92),
                                                    ),
                                                    width: 77.85,
                                                    height: 22.44,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Add To Cart",
                                                      style: TextStyle(
                                                          fontFamily: "Mulish",
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 9,
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
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 11.4,
                                              ),
                                              child: Text(
                                                "Net Wet: 500gm",
                                                style: TextStyle(
                                                  fontSize: 7.9,
                                                  fontFamily: "Mulish",
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromRGBO(
                                                    53,
                                                    53,
                                                    53,
                                                    1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 30.4,
                                              ),
                                              child: Text(
                                                "MRP: \u{20B9}${245}",
                                                style: TextStyle(
                                                  fontSize: 10.9,
                                                  fontFamily: "Mulish",
                                                  fontWeight: FontWeight.w700,
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
                                  )
                                ],
                              ),
                            ),
                            elevation: 3.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 23.71,
                          ),
                          child: Card(
                            child: Container(
                              width: 185.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.21),
                              ),
                              height: 257.7,
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/Product-image.png"),
                                  ),
                                  Container(
                                    height: 78,
                                    width: 185.9,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 11),
                                                  child: Text(
                                                    "Chicken Breast",
                                                    style: TextStyle(
                                                        fontSize: 8.89,
                                                        fontFamily: "Mulish",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Color.fromRGBO(
                                                          53,
                                                          53,
                                                          53,
                                                          1,
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 11),
                                                  child: Text(
                                                    "Boneless",
                                                    style: TextStyle(
                                                        fontSize: 8.71,
                                                        fontFamily: "Mulish",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Color.fromRGBO(
                                                          117,
                                                          116,
                                                          116,
                                                          1,
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 3.4,
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {},
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                        163,
                                                        18,
                                                        28,
                                                        1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.92),
                                                    ),
                                                    width: 77.85,
                                                    height: 22.44,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Add To Cart",
                                                      style: TextStyle(
                                                          fontFamily: "Mulish",
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 9,
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
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 11.4,
                                              ),
                                              child: Text(
                                                "Net Wet: 500gm",
                                                style: TextStyle(
                                                  fontSize: 7.9,
                                                  fontFamily: "Mulish",
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromRGBO(
                                                    53,
                                                    53,
                                                    53,
                                                    1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 30.4,
                                              ),
                                              child: Text(
                                                "MRP: \u{20B9}${245}",
                                                style: TextStyle(
                                                  fontSize: 10.9,
                                                  fontFamily: "Mulish",
                                                  fontWeight: FontWeight.w700,
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
                                  )
                                ],
                              ),
                            ),
                            elevation: 3.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 23.71,
                          ),
                          child: Card(
                            child: Container(
                              width: 185.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.21),
                              ),
                              height: 257.7,
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/Product-image.png"),
                                  ),
                                  Container(
                                    height: 78,
                                    width: 185.9,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 11),
                                                  child: Text(
                                                    "Chicken Breast",
                                                    style: TextStyle(
                                                        fontSize: 8.89,
                                                        fontFamily: "Mulish",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Color.fromRGBO(
                                                          53,
                                                          53,
                                                          53,
                                                          1,
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 11),
                                                  child: Text(
                                                    "Boneless",
                                                    style: TextStyle(
                                                        fontSize: 8.71,
                                                        fontFamily: "Mulish",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Color.fromRGBO(
                                                          117,
                                                          116,
                                                          116,
                                                          1,
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 3.4,
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {},
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                        163,
                                                        18,
                                                        28,
                                                        1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.92),
                                                    ),
                                                    width: 77.85,
                                                    height: 22.44,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Add To Cart",
                                                      style: TextStyle(
                                                          fontFamily: "Mulish",
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 9,
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
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 11.4,
                                              ),
                                              child: Text(
                                                "Net Wet: 500gm",
                                                style: TextStyle(
                                                  fontSize: 7.9,
                                                  fontFamily: "Mulish",
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromRGBO(
                                                    53,
                                                    53,
                                                    53,
                                                    1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 30.4,
                                              ),
                                              child: Text(
                                                "MRP: \u{20B9}${245}",
                                                style: TextStyle(
                                                  fontSize: 10.9,
                                                  fontFamily: "Mulish",
                                                  fontWeight: FontWeight.w700,
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
                                  )
                                ],
                              ),
                            ),
                            elevation: 3.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 21.4,
                  ),
                  Image.asset(
                    "assets/images/Discount-banner.png",
                    scale: 0.5,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24.04,
                    ),
                    child: Text(
                      "Shop By Categories",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(
                          53,
                          53,
                          53,
                          1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    child: GridView.count(
                      crossAxisCount: 3,
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 25,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/Chicken-Category.png",
                                height: 101,
                                width: 108,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5, top: 2),
                                child: Text(
                                  "Chicken",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromRGBO(
                                        34,
                                        35,
                                        35,
                                        1,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/eggs-Category.png",
                                height: 101,
                                width: 108,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5, top: 2),
                                child: Text(
                                  "Eggs",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromRGBO(
                                        34,
                                        35,
                                        35,
                                        1,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
