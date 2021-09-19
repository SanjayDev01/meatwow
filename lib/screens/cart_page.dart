import 'dart:async';
import 'dart:convert';
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:meatwow/config/uri.dart';
import 'package:meatwow/models/cart_model.dart';
import 'package:meatwow/models/coupon.dart';
import 'package:meatwow/models/user.dart';
import 'package:meatwow/models/user.dart';
import 'package:meatwow/screens/checkout.dart';
import 'package:meatwow/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as htt;
import 'address.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool validLocation = false;
  bool isLoad = false;
  GetCart getCart;
  String productId;
  bool cartIsEmpty = false;
  int subTotal = 0;
  int productQuantity;
  String couponCode;
  int discount = 0;
  TextEditingController couponController = TextEditingController();

  @override
  void initState() {
    setState(() {
      if (shopID != null) {
        validLocation = true;
        getCartData();
      } else {
        validLocation = false;
      }
    });
    super.initState();
  }

  getCartData() async {
    setState(() {
      isLoad = true;
    });
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
          getCart = y;
          isLoad = false;
          productId = y.cart.first.sId;
          productQuantity = y.cart.first.productQuantity;
          if (subTotal == 0) {
            final list = y.cart.map((e) => e.productVariant.salePrice);
            subTotal = list.sum;
            print(subTotal);
          }

          // subTotal = y.cart.forEach((element) {
          //   subTotal += element.productQuantity;
          // });
        });
      } else {
        setState(() {
          cartIsEmpty = true;
        });
      }
    } else {
      setState(() {
        validLocation = false;
        isLoad = false;
      });
    }
  }

  updateCartData() async {
    Map patchBody = {
      "productQuantity": productQuantity,
    };
    setState(() {
      isLoad = true;
    });
    String apiUrl = Ur().uri;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String refToken = prefs.getString("c_refToken");
    String token = prefs.getString("c_access_token");

    Uri ur = Uri.parse('$apiUrl/cart/$productId');
    var resCartDetail = await htt.patch(
      ur,
      headers: {
        "Content-Type": "application/json",
        "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg",
        "Cookie": "$refToken;$token",
      },
      body: json.encode(patchBody),
    );

    var resCart = SignOut.fromJson(json.decode(resCartDetail.body));

    if (resCart.msg) {
      setState(() {
        isLoad = false;
        productId = getCart.cart.first.sId;
      });
    }
  }

  deleteOrder() async {
    setState(() {
      isLoad = true;
    });
    String apiUrl = Ur().uri;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String refToken = prefs.getString("c_refToken");
    String token = prefs.getString("c_access_token");

    Uri ur = Uri.parse('$apiUrl/cart/$productId');
    var resProDetail = await htt.delete(ur, headers: {
      "Content-Type": "application/json",
      "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg",
      "Cookie": "$refToken;$token",
    });

    if (resProDetail != null) {
      // var y = GetCart.fromJson(json.decode(resProDetail.body));
      print("Deleted $productId");
      setState(() {
        isLoad = false;
      });
      getCartData();
    }
  }

  getCoupon(context) async {
    setState(() {
      isLoad = true;
    });
    String apiUrl = Ur().uri;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String refToken = prefs.getString("c_refToken");
    String token = prefs.getString("c_access_token");
    //print(couponCode);

    Uri ur =
        Uri.parse('$apiUrl/coupon/validate-coupon/${couponCode.toUpperCase()}');
    var resCoupon = await htt.get(ur, headers: {
      "Content-Type": "application/json",
      "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg",
      "Cookie": "$refToken;$token",
    });

    var boolCoupon = DiscountCoupon.fromJson(json.decode(resCoupon.body));
    if (resCoupon.statusCode == 200) {
      discount = boolCoupon.coupon.discount;
      showSnackForCoupon(context);
    } else {
      showSnackForCouponFailed(context);
    }
    setState(() {
      isLoad = false;
    });
  }

  showSnackForCouponFailed(context) {
    final snackBar = SnackBar(content: Text('Your Coupon is invalid!'));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showSnackForCoupon(context) {
    final snackBar =
        SnackBar(content: Text('Congrats your Coupon is Applied!'));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showSnack(context) {
    final snackBar =
        SnackBar(content: Text("Sorry we don't deliver in your location"));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
                  ? Column(
                      children: [
                        cartIsEmpty
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    "Your Cart is Empty",
                                    style: TextStyle(
                                        fontFamily: "Mulish",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(
                                          8,
                                          50,
                                          81,
                                          1,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                ],
                              )
                            : (isLoad
                                ? LinearProgressIndicator(
                                    minHeight: 6,
                                    backgroundColor: Colors.white,
                                    color: Color.fromRGBO(163, 18, 28, 1),
                                  )
                                : Column(
                                    children: getCart.cart
                                        .map(
                                          (e) => Padding(
                                            padding: const EdgeInsets.all(13),
                                            child: Container(
                                              height: 116,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Card(
                                                elevation: 3.0,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 18,
                                                              ),
                                                              child: Text(
                                                                e.product.title,
                                                                style:
                                                                    TextStyle(
                                                                        fontFamily:
                                                                            "Mulish",
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Color
                                                                            .fromRGBO(
                                                                          8,
                                                                          50,
                                                                          81,
                                                                          1,
                                                                        )),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 18,
                                                              ),
                                                              child: Text(
                                                                e.productVariant
                                                                            .productQuantityType >
                                                                        999
                                                                    ? "Net Wt: ${e.productVariant.productQuantityType} Kg"
                                                                    : "Net Wt: ${e.productVariant.productQuantityType} g",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          117,
                                                                          116,
                                                                          116,
                                                                          1),
                                                                  fontFamily:
                                                                      "Mulish",
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10),
                                                          child: IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  productId =
                                                                      e.sId;
                                                                  subTotal = subTotal -
                                                                      e.productVariant
                                                                          .salePrice;
                                                                });
                                                                print(
                                                                    productId);
                                                                deleteOrder();
                                                              },
                                                              icon: Icon(
                                                                Icons.close,
                                                              )),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 4,
                                                              ),
                                                              child: IconButton(
                                                                onPressed:
                                                                    (e.productQuantity >
                                                                            1)
                                                                        ? () {
                                                                            setState(() {
                                                                              productQuantity = e.productQuantity - 1;
                                                                              productId = e.sId;
                                                                              subTotal = subTotal - e.productVariant.salePrice;
                                                                              print(subTotal);
                                                                            });
                                                                            updateCartData();
                                                                            getCartData();
                                                                          }
                                                                        : null,
                                                                icon: Icon(Icons
                                                                    .remove_circle_outline),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 11,
                                                                right: 11,
                                                              ),
                                                              child: Text(
                                                                e.productQuantity
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Mulish",
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                    8,
                                                                    50,
                                                                    81,
                                                                    1,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  productQuantity =
                                                                      e.productQuantity +
                                                                          1;
                                                                  productId =
                                                                      e.sId;
                                                                  subTotal = subTotal +
                                                                      e.productVariant
                                                                          .salePrice;
                                                                });
                                                                updateCartData();
                                                                getCartData();
                                                              },
                                                              icon: Icon(
                                                                Icons
                                                                    .add_circle_outline,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 22),
                                                          child: Text(
                                                            "\u{20B9}${e.productQuantity * e.productVariant.salePrice}",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Mulish",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 20,
                                                              color: Color
                                                                  .fromRGBO(
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
                                        )
                                        .toList())),
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
                                controller: couponController,
                                textAlignVertical: TextAlignVertical.bottom,
                                textCapitalization:
                                    TextCapitalization.characters,
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
                              padding:
                                  const EdgeInsets.only(left: 0, right: 18),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    couponCode = couponController.text;
                                  });
                                  getCoupon(context);
                                },
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
                          height: 120,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 16),
                                      child: Text(
                                        "Subtotal",
                                        style: TextStyle(
                                          fontFamily: "Mulish",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromRGBO(117, 116, 116, 1),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Text(
                                        "\u{20B9}$subTotal",
                                        style: TextStyle(
                                          fontFamily: "Mulish",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromRGBO(117, 116, 116, 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 6),
                                      child: Text(
                                        "Discount",
                                        style: TextStyle(
                                          fontFamily: "Mulish",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromRGBO(117, 116, 116, 1),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Text(
                                        discount != 0
                                            ? "- \u{20B9}${subTotal * discount / 100}"
                                            : "- \u{20B9}0",
                                        style: TextStyle(
                                          fontFamily: "Mulish",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromRGBO(117, 116, 116, 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  child: SizedBox(
                                    height: 1.5,
                                    width: MediaQuery.of(context).size.width,
                                    child: Container(
                                      color: Color.fromRGBO(221, 221, 221, 1),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, bottom: 16),
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
                                      padding: const EdgeInsets.only(
                                          right: 20, bottom: 16),
                                      child: Text(
                                        "\u{20B9}${subTotal - (subTotal * discount / 100)}",
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
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 260,
                        ),
                        Center(
                          child: Container(
                            height: 187,
                            width: MediaQuery.of(context).size.width,
                            color: Color.fromRGBO(8, 50, 81, 1),
                            alignment: Alignment.center,
                            child: Text(
                              "Sorry we don’t deliver at your location",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontSize: 26,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(
                                    255,
                                    255,
                                    255,
                                    1,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
          GestureDetector(
            onTap: () {
              validLocation
                  ? Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CheckoutPage()))
                  // ignore: unnecessary_statements
                  : showSnack(context);
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
