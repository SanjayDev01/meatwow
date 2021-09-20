import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as htt;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meatwow/config/uri.dart';
import 'package:meatwow/models/cart_model.dart';
import 'package:meatwow/models/productsResponse.dart';
import 'package:meatwow/models/shops.dart';
import 'package:meatwow/models/single_product.dart';
import 'package:meatwow/screens/cart_page.dart';
import 'package:meatwow/screens/my_account.dart';
import 'package:meatwow/screens/product_category.dart';
import 'package:meatwow/screens/product_detail.dart';
import 'package:meatwow/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String ab = "acc";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String assetName = 'assets/images/Sticky-chicken-category.svg';
  final String assetName1 = 'assets/images/Sticky-eggs-category.svg';
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool productsFetched = false;
  bool gotLocation = false;
  double longitude;
  int cartLength = 0;
  double latitude;
  bool cartEmpty = true;
  Product product;

  SingleProduct singleProduct;

  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print(
          "Location permissions are permanently denied, we cannot request permissions.");
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    Position position = await _determinePosition();
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
      if (latitude != null) {
        gotLocation = true;
      }
    });

    gotLocation ? getShop() : getAllProducts();

    // print(gotLocation);
    // getShop(longitude, latitude);
  }

  getCart() async {
    String apiUrl = Ur().uri;
    String userId = userObject["id"];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String refToken = prefs.getString("c_refToken");
    String token = prefs.getString("c_access_token");

    Uri ur = Uri.parse('$apiUrl/cart?shopId=$shopID&userId=$userId');
    var resProDetail = await htt.get(ur, headers: {
      "Content-Type": "application/json",
      "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg",
      "Cookie": "$refToken;$token",
    });

    if (resProDetail.body != null) {
      var y = GetCart.fromJson(json.decode(resProDetail.body));
      //print(y.cart.first.sId);

      if (y.cart.isNotEmpty) {
        setState(() {
          cartLength = y.cart.length;
          cartEmpty = false;
        });
      }
    }
  }

  getShop() async {
    String apiUrl = Ur().uri;
    Map<String, dynamic> userMap;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String refToken = prefs.getString("c_refToken");
    String token = prefs.getString("c_access_token");

    if (token != null) {
      userMap = JwtDecoder.decode(token);
      //  print(userMap["id"]);
      userObject = userMap;
      print(userObject["id"]);
    }

    // Uri uri = Uri.http('$apiUrl', '/shops/find/shop-location',
    //     {"coordinates": "$longitude,$latitude"});
    Uri ur1 = Uri.parse(
        '$apiUrl/shops/find/shop-location?coordinates=$longitude,$latitude');
    print(ur1);
    //print("$refToken;$token");

    var resShop = await htt.get(ur1, headers: {
      "Content-Type": "application/json",
      "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg",
      "Cookie": "$refToken;$token",
    });

    if (resShop.body != null) {
      // print(resShop.body);
      var z = ShopResponse.fromJson(json.decode(resShop.body));

      if (z.shop != null) {
        var y = z.shop as Shop;
        var shopId = y.id;
        print(shopId);
        shopID = shopId;
        Uri ur = Uri.parse(
            '$apiUrl/products?limit=10&offset=0&forAdmin=false&shopId=$shopId');
        //'/products/chicken-breast');
        var resPro = await htt.get(ur, headers: {
          "Content-Type": "application/json",
          "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg",
          "Cookie": "$refToken;$token",
        });

        if (resPro.body != null) {
          var c = SingleProduct.fromJson(jsonDecode(resPro.body));
          var y = c.products.sId;
          print(y);
          if (y != null) {
            setState(() {
              productsFetched = true;
              singleProduct = c;
            });
          }

          getCart();

          // ignore: unnecessary_cast

        }
      } else if (z.shop == null) {
        print("shop is empty");
        getAllProducts();
      }
    } else {
      print("shop is emptyyy");
    }
  }

  getAllProducts() async {
    String apiUrl = Ur().uri;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String refToken = prefs.getString("c_refToken");
    String token = prefs.getString("c_access_token");

    Uri ur = Uri.parse('$apiUrl/products?limit=10&offset=0&forAdmin=false');
    var resProAll = await htt.get(ur, headers: {
      "Content-Type": "application/json",
      "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg",
      "Cookie": "$refToken;$token",
    });

    if (resProAll.body != null) {
      var y = Product.fromJson(jsonDecode(resProAll.body));

      print(y.products.first.title);
      if (y.products.first.title != null) {
        setState(() {
          productsFetched = true;
          gotLocation = false;
          product = y;
        });
      }
    }
  }

  productCard() {
    return Container(
      height: 360,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: singleProduct.products.products
            .map<Widget>(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetail(
                                slug: e.slug,
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 23.71,
                  ),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Container(
                      width: 247.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 353.7,
                      child: Column(
                        children: [
                          Image.network(
                            e.image,
                            fit: BoxFit.fill,

                            scale: 0.5,
                            //width: 257,
                            //height: 239,
                          ),
                          // CachedNetworkImage(
                          //   imageUrl: e.image,
                          //   fit: BoxFit.fill,
                          // ),

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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 13),
                                          child: Text(
                                            e.title,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Mulish",
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
                                          padding:
                                              const EdgeInsets.only(left: 13),
                                          child: Text(
                                            e.slug,
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: "Mulish",
                                                fontWeight: FontWeight.w400,
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
                                                BorderRadius.circular(1.92),
                                          ),
                                          width: 105,
                                          height: 30,
                                          alignment: Alignment.center,
                                          padding:
                                              EdgeInsets.fromLTRB(18, 7, 17, 6),
                                          child: Text(
                                            "Quick View",
                                            style: TextStyle(
                                                fontFamily: "Mulish",
                                                fontWeight: FontWeight.w700,
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
                                        left: 20.4,
                                      ),
                                      child: Text(
                                        "MRP: \u{20B9}${e.productVariant.first.salePrice}",
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
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 13,
                                      ),
                                      child: Text(
                                        "${e.productVariant.first.price}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Mulish",
                                          fontWeight: FontWeight.w700,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                          color: Color.fromRGBO(
                                            53,
                                            53,
                                            53,
                                            1,
                                          ),
                                        ),
                                      ),
                                    ),
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
              ),
            )
            .toList(),
      ),
    );
  }

  allProductsCard() {
    return Container(
      height: 360,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: product.products
            .map<Widget>(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetail(
                                slug: e.slug,
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 23.71,
                  ),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Container(
                      width: 247.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 353.7,
                      child: Column(
                        children: [
                          Image.network(
                            e.image,
                            scale: 0.5,
                            //width: 257,
                            //height: 239,
                          ),
                          //CachedNetworkImage(imageUrl: e.image),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 13),
                                          child: Text(
                                            e.title,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Mulish",
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
                                          padding:
                                              const EdgeInsets.only(left: 13),
                                          child: Text(
                                            e.slug,
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: "Mulish",
                                                fontWeight: FontWeight.w400,
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
                                                BorderRadius.circular(1.92),
                                          ),
                                          width: 105,
                                          height: 30,
                                          alignment: Alignment.center,
                                          padding:
                                              EdgeInsets.fromLTRB(18, 7, 17, 6),
                                          child: Text(
                                            "Quick View",
                                            style: TextStyle(
                                                fontFamily: "Mulish",
                                                fontWeight: FontWeight.w700,
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
                                        left: 20.4,
                                      ),
                                      child: Text(
                                        "MRP: \u{20B9}${e.productVariant.first.salePrice}",
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
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 13,
                                      ),
                                      child: Text(
                                        "${e.productVariant.first.price}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Mulish",
                                          fontWeight: FontWeight.w700,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                          color: Color.fromRGBO(
                                            53,
                                            53,
                                            53,
                                            1,
                                          ),
                                        ),
                                      ),
                                    ),
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
              ),
            )
            .toList(),
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
                              child: cartEmpty
                                  ? IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CartPage()));
                                      },
                                      icon: Icon(
                                        Icons.shopping_cart_outlined,
                                        size: 28,
                                      ))
                                  : GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CartPage()));
                                      },
                                      child: Stack(children: [
                                        Container(
                                          height: 44,
                                          width: 40,
                                          child: Icon(
                                            Icons.shopping_cart_outlined,
                                            color: Color.fromRGBO(
                                              163,
                                              18,
                                              28,
                                              1,
                                            ),
                                            size: 28,
                                          ),
                                        ),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color.fromRGBO(
                                                163,
                                                18,
                                                28,
                                                1,
                                              )),
                                          child: Text(
                                            cartLength.toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontFamily: "Mulish",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ], alignment: Alignment.topRight),
                                    )),
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
                          border: Border.all(color: Colors.white, width: 0.64),
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
                          border: Border.all(color: Colors.white, width: 0.64),
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
                          border: Border.all(color: Colors.white, width: 0.64),
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
                          border: Border.all(color: Colors.white, width: 0.64),
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
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
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
                                padding:
                                    const EdgeInsets.fromLTRB(18, 20, 18, 0),
                                child: Container(
                                  height: 86.74,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                        productsFetched
                            ? (gotLocation ? productCard() : allProductsCard())
                            : LinearProgressIndicator(
                                minHeight: 6,
                                backgroundColor: Colors.white,
                                color: Color.fromRGBO(163, 18, 28, 1),
                              ),
                        SizedBox(
                          height: 15,
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
                            // childAspectRatio: ,
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
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 2),
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
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 2),
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
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
