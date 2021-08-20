import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meatwow/screens/product_category.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
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
                  Image.asset(
                    "assets/images/Product-image.png",
                    width: MediaQuery.of(context).size.width,
                    //scale: 0.2,
                    fit: BoxFit.fill,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 22,
                              top: 16,
                            ),
                            child: Text(
                              "Chicken Breast",
                              style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 22,
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
                              left: 22,
                              top: 1.05,
                            ),
                            child: Text(
                              "Boneless",
                              style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(
                                    117,
                                    116,
                                    116,
                                    1,
                                  )),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 190, top: 16, right: 25),
                        child: Text(
                          "\u{20B9}${219}",
                          style: TextStyle(
                            fontSize: 24.31,
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
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      22,
                      12.66,
                      25,
                      12.66,
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 1.2,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Container(
                          color: Color.fromRGBO(
                            204,
                            204,
                            204,
                            1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      22,
                      0,
                      25,
                      0,
                    ),
                    child: Text(
                      "Chicken Breast is one of the meatier cuts of a Chicken, which comes from the breast-bone of the bird. This cut is skinless and has a supple texture. A good source of vitamins and minerals, Chicken Breast, is also a great choice for a lean protein diet. Apply a flavourful spice-rub and pan-fry, bake, grill, or slow-cook the Chicken Breast to relish this versatile cut. Order fresh Chicken Breast online from Licious and get it home-delivered.",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(
                            117,
                            116,
                            116,
                            1,
                          )),
                      maxLines: 9,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 23.44,
                          top: 29.33,
                        ),
                        child: Text(
                          "Net Wt.",
                          style: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(
                                53,
                                53,
                                53,
                                1,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 16.33,
                        ),
                        child: Container(
                          width: 55,
                          height: 55,
                          alignment: Alignment.center,
                          child: Text(
                            "1kg",
                            style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(
                                  53,
                                  53,
                                  53,
                                  1,
                                )),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color.fromRGBO(
                                53,
                                53,
                                53,
                                1,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 16.33,
                        ),
                        child: Container(
                          width: 55,
                          height: 55,
                          alignment: Alignment.center,
                          child: Text(
                            "500g",
                            style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(
                                  53,
                                  53,
                                  53,
                                  1,
                                )),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color.fromRGBO(
                                204,
                                204,
                                204,
                                1,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 16.33,
                        ),
                        child: Container(
                          width: 55,
                          height: 55,
                          alignment: Alignment.center,
                          child: Text(
                            "250g",
                            style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(
                                  53,
                                  53,
                                  53,
                                  1,
                                )),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color.fromRGBO(
                                204,
                                204,
                                204,
                                1,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 16.33,
                        ),
                        child: Container(
                          width: 55,
                          height: 55,
                          alignment: Alignment.center,
                          child: Text(
                            "200g",
                            style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(
                                  53,
                                  53,
                                  53,
                                  1,
                                )),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color.fromRGBO(
                                204,
                                204,
                                204,
                                1,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 23.44,
                          top: 29.33,
                        ),
                        child: Text(
                          "Pcs Size",
                          style: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(
                                53,
                                53,
                                53,
                                1,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 16.33,
                        ),
                        child: Container(
                          width: 55,
                          height: 55,
                          alignment: Alignment.center,
                          child: Text(
                            "S",
                            style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(
                                  53,
                                  53,
                                  53,
                                  1,
                                )),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color.fromRGBO(
                                53,
                                53,
                                53,
                                1,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 16.33,
                        ),
                        child: Container(
                          width: 55,
                          height: 55,
                          alignment: Alignment.center,
                          child: Text(
                            "M",
                            style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(
                                  53,
                                  53,
                                  53,
                                  1,
                                )),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color.fromRGBO(
                                204,
                                204,
                                204,
                                1,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 16.33,
                        ),
                        child: Container(
                          width: 55,
                          height: 55,
                          alignment: Alignment.center,
                          child: Text(
                            "L",
                            style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(
                                  53,
                                  53,
                                  53,
                                  1,
                                )),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color.fromRGBO(
                                204,
                                204,
                                204,
                                1,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 19, 0, 12),
                    child: Text(
                      "People Also Buy",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
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
                    height: 353,
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
                              width: 247.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.21),
                              ),
                              height: 353.7,
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/Rectangle 33.png",
                                    scale: 0.5,
                                    //width: 257,
                                    //height: 239,
                                  ),
                                  Container(
                                    height: 104,
                                    width: 247.9,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 13),
                                                  child: Text(
                                                    "Chicken Breast",
                                                    style: TextStyle(
                                                        fontSize: 15,
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
                                                          left: 13),
                                                  child: Text(
                                                    "Boneless",
                                                    style: TextStyle(
                                                        fontSize: 11,
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 11,
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1.92),
                                                  ),
                                                  width: 105,
                                                  height: 30,
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.fromLTRB(
                                                      18, 7, 17, 6),
                                                  child: Text(
                                                    "Add To Cart",
                                                    style: TextStyle(
                                                        fontFamily: "Mulish",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 12,
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
                                          height: 19.64,
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 13,
                                              ),
                                              child: Text(
                                                "Net Wet: 500gm",
                                                style: TextStyle(
                                                  fontSize: 12,
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
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 20.4,
                                              ),
                                              child: Text(
                                                "MRP: \u{20B9}${245}",
                                                style: TextStyle(
                                                  fontSize: 17,
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
                              width: 247.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.21),
                              ),
                              height: 353.7,
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/Rectangle 33.png",
                                    scale: 0.5,
                                    //width: 257,
                                    //height: 239,
                                  ),
                                  Container(
                                    height: 104,
                                    width: 247.9,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 13),
                                                  child: Text(
                                                    "Chicken Breast",
                                                    style: TextStyle(
                                                        fontSize: 15,
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
                                                          left: 13),
                                                  child: Text(
                                                    "Boneless",
                                                    style: TextStyle(
                                                        fontSize: 11,
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 11,
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1.92),
                                                  ),
                                                  width: 105,
                                                  height: 30,
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.fromLTRB(
                                                      18, 7, 17, 6),
                                                  child: Text(
                                                    "Add To Cart",
                                                    style: TextStyle(
                                                        fontFamily: "Mulish",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 12,
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
                                          height: 19.64,
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 13,
                                              ),
                                              child: Text(
                                                "Net Wet: 500gm",
                                                style: TextStyle(
                                                  fontSize: 12,
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
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 20.4,
                                              ),
                                              child: Text(
                                                "MRP: \u{20B9}${245}",
                                                style: TextStyle(
                                                  fontSize: 17,
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
                  SizedBox(height: 40),
                  Container(
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
                      "Add To Cart",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
