import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meatwow/config/uri.dart';
import 'package:meatwow/models/billingInfo.dart';
import 'package:meatwow/models/user.dart';
import 'package:meatwow/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as htt;

import 'cart_page.dart';

class AddressPage extends StatefulWidget {
  final bool newAddress;
  final BillingInfo1 address1;

  const AddressPage({Key key, this.newAddress, this.address1})
      : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState(
        newAddress: newAddress,
        address1: address1,
      );
}

class _AddressPageState extends State<AddressPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  BillingInfo1 billingInfo1;
  BiilingInfo biilingInfo;
  final BillingInfo1 address1;
  bool isLoad = false;
  final bool newAddress;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController stateController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  _AddressPageState({this.newAddress, this.address1});

  @override
  void initState() {
    super.initState();
    biilingInfo = BiilingInfo();
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  addBiilingInfo(context) async {
    setState(() {
      isLoad = true;
    });
    String apiUrl = Ur().uri;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String refToken = prefs.getString("c_refToken");
    String token = prefs.getString("c_access_token");
    // Uri uri = Uri.http('$apiUrl', '/shops/find/shop-location',
    //     {"coordinates": "$longitude,$latitude"});
    Uri ur1 = Uri.parse('$apiUrl/user/billing-info');
    print(ur1);

    Map billData = BiilingInfo(
      address: biilingInfo.address,
      city: biilingInfo.city,
      email: biilingInfo.email,
      name: biilingInfo.name,
      state: biilingInfo.state,
      phoneNumber: biilingInfo.phoneNumber,
      isAnonymous: false,
      userId: userObject['id'],
    ).toJson();
    print(billData);
    //print("$refToken;$token");

    var resShop = await htt.post(ur1,
        headers: {
          "Content-Type": "application/json",
          "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg",
          "Cookie": "$refToken;$token",
        },
        body: json.encode(billData));

    print(resShop.body);
    var z = SignOut.fromJson(json.decode(resShop.body));
    if (z.msg) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CartPage()));
      setState(() {
        isLoad = false;
      });
    }
  }

  showMessage(context) {
    final snackBar =
        SnackBar(content: Text("Sorry we don't deliver in your location"));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  updateAddress(context) async {
    setState(() {
      isLoad = true;
    });
    String apiUrl = Ur().uri;
    String userId = userObject['id'];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String refToken = prefs.getString("c_refToken");
    String token = prefs.getString("c_access_token");
    // Uri uri = Uri.http('$apiUrl', '/shops/find/shop-location',
    //     {"coordinates": "$longitude,$latitude"});
    Uri ur1 = Uri.parse('$apiUrl/user/billing-info/$userId');
    print(ur1);

    Map billData = BiilingInfo(
      address: addressController.text.isEmpty
          ? address1.biilingInfo.address
          : addressController.text,
      city: cityController.text.isEmpty
          ? address1.biilingInfo.city
          : cityController.text,
      email: emailController.text.isEmpty
          ? address1.biilingInfo.email
          : emailController.text,
      name: nameController.text.isEmpty
          ? address1.biilingInfo.name
          : nameController.text,
      state: stateController.text.isEmpty
          ? address1.biilingInfo.state
          : stateController.text,
      phoneNumber: phoneController.text.isEmpty
          ? address1.biilingInfo.phoneNumber
          : phoneController.text,
      isAnonymous: false,
      userId: userObject['id'],
    ).toJson();
    print(billData);
    //print("$refToken;$token");

    var resShop = await htt.patch(ur1,
        headers: {
          "Content-Type": "application/json",
          "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg",
          "Cookie": "$refToken;$token",
        },
        body: json.encode(billData));

    print(resShop.body);
    var z = SignOut.fromJson(json.decode(resShop.body));
    if (z.msg) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CartPage()));
      setState(() {
        isLoad = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add address",
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
        body: SafeArea(
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: globalFormKey,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  isLoad
                      ? LinearProgressIndicator(
                          minHeight: 6,
                          backgroundColor: Colors.white,
                          color: Color.fromRGBO(163, 18, 28, 1),
                        )
                      : Text(""),
                  SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 38,
                      top: 20,
                    ),
                    child: Text(
                      "Name",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color.fromRGBO(53, 53, 53, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      //   height: 44,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        onSaved: (input) => biilingInfo.name = input,
                        validator: (input) => input.length < 3
                            ? "Name should be more than 3 characters"
                            : null,
                        textAlignVertical: TextAlignVertical.center,
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefix: Text("    "),
                            hintText: "Name",
                            hintStyle: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(175, 175, 175, 1),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 38,
                      top: 20,
                    ),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color.fromRGBO(53, 53, 53, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // height: 44,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.center,
                        validator: (input) => !input.contains('@')
                            ? "Email Id should be valid"
                            : null,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        onSaved: (input) => biilingInfo.email = input,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefix: Text("    "),
                            hintText: "Enter Email",
                            hintStyle: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(175, 175, 175, 1),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 38,
                      top: 20,
                    ),
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color.fromRGBO(53, 53, 53, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // height: 44,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.center,
                        validator: (input) => input.length < 10
                            ? "Phone Number should be equal to 10 digits"
                            : null,
                        keyboardType: TextInputType.number,
                        controller: phoneController,
                        onSaved: (input) => biilingInfo.phoneNumber = input,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefix: Text("    "),
                            hintText: "Enter Phone Number",
                            hintStyle: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(175, 175, 175, 1),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 38,
                      top: 20,
                    ),
                    child: Text(
                      "Add Address",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color.fromRGBO(53, 53, 53, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // height: 44,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.center,
                        controller: addressController,
                        validator: (input) =>
                            input.length < 10 ? "Address is too small" : null,
                        keyboardType: TextInputType.streetAddress,
                        onSaved: (input) => biilingInfo.address = input,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefix: Text("    "),
                            hintText: "Enter Address",
                            hintStyle: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(175, 175, 175, 1),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 38,
                      top: 20,
                    ),
                    child: Text(
                      "State",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color.fromRGBO(53, 53, 53, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // height: 44,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.center,
                        controller: stateController,
                        validator: (input) =>
                            input.isEmpty ? "State can't be empty" : null,
                        keyboardType: TextInputType.name,
                        onSaved: (input) => biilingInfo.state = input,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefix: Text("    "),
                            hintText: "Enter Valid State",
                            hintStyle: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(175, 175, 175, 1),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 38,
                      top: 20,
                    ),
                    child: Text(
                      "City",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color.fromRGBO(53, 53, 53, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // height: 44,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.center,
                        controller: cityController,
                        validator: (input) =>
                            input.isEmpty ? "City can't be empty" : null,
                        keyboardType: TextInputType.name,
                        onSaved: (input) => biilingInfo.city = input,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefix: Text("    "),
                            hintText: "Enter Valid City",
                            hintStyle: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(175, 175, 175, 1),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 22,
                      right: 22,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        newAddress
                            ? validateAndSave()
                                ? addBiilingInfo(context)
                                : showMessage(context)
                            : updateAddress(context);
                      },
                      child: Container(
                        height: 54,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(
                            163,
                            18,
                            28,
                            1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Save and Proceed",
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
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
