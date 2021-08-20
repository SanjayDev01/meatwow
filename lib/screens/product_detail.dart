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
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
