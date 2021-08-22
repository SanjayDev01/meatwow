import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
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
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 38,
                    top: 20,
                  ),
                  child: Text(
                    "Flat no/ Building name/ street name",
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
                    height: 44,
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefix: Text("    "),
                          hintText: "Flat No.",
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
                    height: 44,
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      textAlignVertical: TextAlignVertical.bottom,
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
                    "Landmark  [Optional]",
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
                    height: 44,
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefix: Text("    "),
                          hintText: "Landmark",
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
                    "Pin Code",
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
                    height: 44,
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefix: Text("    "),
                          hintText: "eg. 400008",
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
                    onTap: () {},
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
        ));
  }
}
