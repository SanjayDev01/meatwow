import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meatwow/screens/product_detail.dart';

class ProductCategory extends StatefulWidget {
  @override
  _ProductCategoryState createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  final String assetName = 'assets/images/Sticky-chicken-category.svg';
  final String assetName1 = 'assets/images/Sticky-eggs-category.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Color.fromRGBO(255, 255, 255, 1),
            width: MediaQuery.of(context).size.width,
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
                                  const EdgeInsets.fromLTRB(28, 15, 27.91, 0),
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
                          padding:
                              const EdgeInsets.fromLTRB(27.91, 15.4, 27.91, 0),
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductCategory()));
                          },
                          child: Container(
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
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 8),
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetail()));
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                height: 381,
                                child: Card(
                                    elevation: 4.0,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            "assets/images/Rectangle 29.png",
                                            height: 212,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            fit: BoxFit.fill,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                28, 15, 0, 0),
                                            child: Text(
                                              "Chicken Breast",
                                              style: TextStyle(
                                                fontFamily: "Mulish",
                                                fontSize: 16.82,
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromRGBO(
                                                    53, 53, 53, 1),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                28, 0, 0, 0),
                                            child: Text(
                                              "Boneless",
                                              style: TextStyle(
                                                fontFamily: "Mulish",
                                                fontSize: 13.46,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    117, 116, 116, 1),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                28, 7.56, 17, 16),
                                            child: Text(
                                              "Chicken Breast is one of the Meatier Cuts of a Chicken, which comes from the Breast-Bone of The Bird. The Cut is the Skin which comes from the Breast-Bone of The Bird. The Cut is the Skin ",
                                              style: TextStyle(
                                                fontFamily: "Mulish",
                                                fontSize: 11,
                                                //letterSpacing: 1.0,
                                                //wordSpacing: 3.0,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    117, 116, 116, 1),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 28,
                                                    ),
                                                    child: Text(
                                                      "Net Wet: 500gm",
                                                      style: TextStyle(
                                                          fontFamily: "Mulish",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 11.33,
                                                          color: Color.fromRGBO(
                                                            117,
                                                            116,
                                                            116,
                                                            1,
                                                          )),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 28, top: 2.0),
                                                    child: Text(
                                                      "MRP: \u{20B9}${245}",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: "Mulish",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Color.fromRGBO(
                                                          163,
                                                          18,
                                                          28,
                                                          1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 132, right: 18),
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.92),
                                                    ),
                                                    width: 140.85,
                                                    height: 36.44,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Add To Cart",
                                                      style: TextStyle(
                                                          fontFamily: "Mulish",
                                                          fontWeight:
                                                              FontWeight.w700,
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
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetail()));
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                height: 381,
                                child: Card(
                                    elevation: 4.0,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            "assets/images/Rectangle 29.png",
                                            height: 212,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            fit: BoxFit.fill,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                28, 15, 0, 0),
                                            child: Text(
                                              "Chicken Breast",
                                              style: TextStyle(
                                                fontFamily: "Mulish",
                                                fontSize: 16.82,
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromRGBO(
                                                    53, 53, 53, 1),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                28, 0, 0, 0),
                                            child: Text(
                                              "Boneless",
                                              style: TextStyle(
                                                fontFamily: "Mulish",
                                                fontSize: 13.46,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    117, 116, 116, 1),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                28, 7.56, 17, 16),
                                            child: Text(
                                              "Chicken Breast is one of the Meatier Cuts of a Chicken, which comes from the Breast-Bone of The Bird. The Cut is the Skin which comes from the Breast-Bone of The Bird. The Cut is the Skin ",
                                              style: TextStyle(
                                                fontFamily: "Mulish",
                                                fontSize: 11,
                                                //letterSpacing: 1.0,
                                                //wordSpacing: 3.0,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    117, 116, 116, 1),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 28,
                                                    ),
                                                    child: Text(
                                                      "Net Wet: 500gm",
                                                      style: TextStyle(
                                                          fontFamily: "Mulish",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 11.33,
                                                          color: Color.fromRGBO(
                                                            117,
                                                            116,
                                                            116,
                                                            1,
                                                          )),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 28, top: 2.0),
                                                    child: Text(
                                                      "MRP: \u{20B9}${245}",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: "Mulish",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Color.fromRGBO(
                                                          163,
                                                          18,
                                                          28,
                                                          1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 132, right: 18),
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.92),
                                                    ),
                                                    width: 140.85,
                                                    height: 36.44,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Add To Cart",
                                                      style: TextStyle(
                                                          fontFamily: "Mulish",
                                                          fontWeight:
                                                              FontWeight.w700,
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
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetail()));
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                height: 381,
                                child: Card(
                                    elevation: 4.0,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            "assets/images/Rectangle 29.png",
                                            height: 212,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            fit: BoxFit.fill,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                28, 15, 0, 0),
                                            child: Text(
                                              "Chicken Breast",
                                              style: TextStyle(
                                                fontFamily: "Mulish",
                                                fontSize: 16.82,
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromRGBO(
                                                    53, 53, 53, 1),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                28, 0, 0, 0),
                                            child: Text(
                                              "Boneless",
                                              style: TextStyle(
                                                fontFamily: "Mulish",
                                                fontSize: 13.46,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    117, 116, 116, 1),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                28, 7.56, 17, 16),
                                            child: Text(
                                              "Chicken Breast is one of the Meatier Cuts of a Chicken, which comes from the Breast-Bone of The Bird. The Cut is the Skin which comes from the Breast-Bone of The Bird. The Cut is the Skin ",
                                              style: TextStyle(
                                                fontFamily: "Mulish",
                                                fontSize: 11,
                                                //letterSpacing: 1.0,
                                                //wordSpacing: 3.0,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    117, 116, 116, 1),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 28,
                                                    ),
                                                    child: Text(
                                                      "Net Wet: 500gm",
                                                      style: TextStyle(
                                                          fontFamily: "Mulish",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 11.33,
                                                          color: Color.fromRGBO(
                                                            117,
                                                            116,
                                                            116,
                                                            1,
                                                          )),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 28, top: 2.0),
                                                    child: Text(
                                                      "MRP: \u{20B9}${245}",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: "Mulish",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Color.fromRGBO(
                                                          163,
                                                          18,
                                                          28,
                                                          1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 132, right: 18),
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.92),
                                                    ),
                                                    width: 140.85,
                                                    height: 36.44,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Add To Cart",
                                                      style: TextStyle(
                                                          fontFamily: "Mulish",
                                                          fontWeight:
                                                              FontWeight.w700,
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
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ),
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
