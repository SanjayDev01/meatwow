import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meatwow/config/uri.dart';
import 'package:http/http.dart' as htt;
import 'package:meatwow/models/cart_model.dart';
import 'package:meatwow/models/product_details.dart';
import 'package:meatwow/screens/product_category.dart';
import 'package:meatwow/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart_page.dart';
import 'home_screen.dart';
import 'my_account.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({this.slug});
  final String slug;

  @override
  _ProductDetailState createState() => _ProductDetailState(
        slug: slug,
      );
}

class _ProductDetailState extends State<ProductDetail> {
  final String slug;
  final String assetName = 'assets/images/Sticky-chicken-category.svg';
  final String assetName1 = 'assets/images/Sticky-eggs-category.svg';
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isPieces = true;
  bool isLoad = false;
  int selectedIndex = 0;
  bool isLoadText = false;
  String product;
  String productPieces;
  int productQuantity;
  String productVariant;
  List<ProductVariant> pVariant;
  ProductDetails productDet;
  int salePrice;
  int price;
  _ProductDetailState({this.slug});

  @override
  void initState() {
    getProductDetails();
    super.initState();
  }

  getProductDetails() async {
    setState(() {
      isLoad = true;
    });
    String apiUrl = Ur().uri;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String refToken = prefs.getString("c_refToken");
    String token = prefs.getString("c_access_token");

    Uri ur = Uri.parse('$apiUrl/products/$slug');
    var resProDetail = await htt.get(ur, headers: {
      "Content-Type": "application/json",
      "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg",
      "Cookie": "$refToken;$token",
    });

    if (resProDetail != null) {
      var y = ProductDetails.fromJson(json.decode(resProDetail.body));

      print(y.product.description);
      setState(() {
        productDet = y;

        isPieces = productDet.product.isPieces;
        isLoad = false;
        product = y.product.productVariant.first.product;
        productVariant = y.product.productVariant.first.sId;
        productQuantity = 1;
        salePrice = y.product.productVariant.first.salePrice;
        price = y.product.productVariant.first.price;
        pVariant = y.product.productVariant;
      });
    }
  }

  addToCart(context) async {
    setState(() {
      isLoadText = true;
    });
    String apiUrl = Ur().uri;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String refToken = prefs.getString("c_refToken");
    String token = prefs.getString("c_access_token");
    // Uri uri = Uri.http('$apiUrl', '/shops/find/shop-location',
    //     {"coordinates": "$longitude,$latitude"});
    Uri ur1 = Uri.parse('$apiUrl/cart');
    print(ur1);

    Map cartData = CartModel(
      userId: userObject["id"],
      shop: shopID,
      product: product,
      productPieces: "S",
      productQuantity: productQuantity,
      productVariant: productVariant,
    ).toJson();
    print(cartData);
    //print("$refToken;$token");

    var resShop = await htt.post(ur1,
        headers: {
          "Content-Type": "application/json",
          "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg",
          "Cookie": "$refToken;$token",
        },
        body: json.encode(cartData));

    print(resShop.body);
    if (resShop.body != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CartPage()));
      setState(() {
        isLoadText = false;
      });
    }
  }

  showMessage(context) {
    final snackBar =
        SnackBar(content: Text("Sorry we don't deliver in your location"));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showWeightOptions(context) {
    return Expanded(
      child: Container(
        height: 75,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: pVariant.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 16.33,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    productVariant = pVariant[index].sId;
                    salePrice = pVariant[index].salePrice;
                    price = pVariant[index].price;
                    selectedIndex = index;
                  });
                },
                child: Container(
                  width: 55,
                  height: 55,
                  alignment: Alignment.center,
                  child: Text(
                    pVariant[index].productQuantityType > 999
                        ? "${pVariant[index].productQuantityType / 1000} Kg"
                        : "${pVariant[index].productQuantityType} g",
                    textAlign: TextAlign.center,
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
                      color: selectedIndex == index
                          ? Color.fromRGBO(
                              53,
                              53,
                              53,
                              1,
                            )
                          : Color.fromRGBO(
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
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 74,
                ),
                Image.asset(
                  "assets/images/meat-wow-logo.png",
                  width: 112.44,
                  height: 30.04,
                ),
                SizedBox(
                  height: 70,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Icon(
                          Icons.home,
                          color: Color.fromRGBO(
                            163,
                            18,
                            28,
                            1,
                          ),
                          size: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          "Home",
                          style: TextStyle(
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(163, 18, 28, 1),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Icon(
                        Icons.toc,
                        color: Color.fromRGBO(
                          163,
                          18,
                          28,
                          1,
                        ),
                        size: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(163, 18, 28, 1),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color.fromRGBO(
                          175,
                          175,
                          175,
                          1,
                        ),
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyAccount()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Icon(
                          Icons.person,
                          color: Color.fromRGBO(
                            163,
                            18,
                            28,
                            1,
                          ),
                          size: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          "My Account",
                          style: TextStyle(
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(163, 18, 28, 1),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
      key: scaffoldKey,
      body: SafeArea(
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Stack(
              children: [
                ListView(
                  scrollDirection: Axis.vertical,
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
                                padding:
                                    const EdgeInsets.fromLTRB(18, 18, 0, 0),
                                child: IconButton(
                                  onPressed: () {
                                    scaffoldKey.currentState.openDrawer();
                                  },
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
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CartPage()));
                                    },
                                    icon: Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 24,
                                    )),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                27.91, 15.4, 27.91, 0),
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
                                border: Border.all(
                                    color: Colors.white, width: 0.64),
                                borderRadius: BorderRadius.circular(3.72),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                    isLoad
                        ? LinearProgressIndicator(
                            minHeight: 6,
                            backgroundColor: Colors.white,
                            color: Color.fromRGBO(163, 18, 28, 1),
                          )
                        : Column(
                            children: [
                              Image.network(
                                productDet.product.image,
                                width: MediaQuery.of(context).size.width,
                                //scale: 0.2,
                                fit: BoxFit.fill,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 22,
                                          top: 16,
                                        ),
                                        child: Text(
                                          productDet.product.title,
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
                                        left: 100, top: 16, right: 0),
                                    child: Text(
                                      "\u{20B9}$salePrice",
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, top: 16, right: 25),
                                    child: Text(
                                      "\u{20B9}$price",
                                      style: TextStyle(
                                        fontSize: 17.31,
                                        decoration: TextDecoration.lineThrough,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        fontFamily: "Mulish",
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(
                                          117,
                                          116,
                                          116,
                                          1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
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
                                  productDet.product.description,
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
                                  showWeightOptions(context),
                                ],
                              ),
                              isPieces
                                  ? Row(
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
                                          child: GestureDetector(
                                            onTap: () {},
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
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            top: 16.33,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {},
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
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            top: 16.33,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {},
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
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(""),
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
                                                      "Desi Eggs",
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
                                                      "Eggs",
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
                                                    padding:
                                                        EdgeInsets.fromLTRB(
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
                                                  "Net Wet: 12 Pcs",
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
                                                      "Desi Eggs",
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
                                                      "Eggs",
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
                                                    padding:
                                                        EdgeInsets.fromLTRB(
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
                                                  "Net Wet: 12 Pcs",
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
                    SizedBox(height: 70),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (shopID != null) {
                      addToCart(context);
                    } else {
                      showMessage(context);
                    }
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
                      isLoadText ? "Please wait!" : "Add To Cart",
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
        ),
      ),
    );
  }
}
