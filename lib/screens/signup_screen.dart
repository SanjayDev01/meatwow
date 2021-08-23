import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meatwow/models/signup_model.dart';
import 'package:meatwow/screens/otp_screen.dart';
import 'package:meatwow/services/api_service.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpRequest signUpRequest;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String otpId;
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    signUpRequest = SignUpRequest();
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  //bool validated = false;

  apiCall() {
    APIService apiService = APIService();
    apiService.signUp(signUpRequest).then((value) {
      if (value.otpId.isNotEmpty) {
        print(value.otpId);

        setState(() {
          otpId = value.otpId;
        });
      } else {
        print("No OTP Id");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: globalFormKey,
            child: Center(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          87,
                          63,
                          87,
                          0,
                        ),
                        child: Center(
                          child: Image(
                            image:
                                AssetImage("assets/images/meat-wow-logo.png"),
                            height: 53,
                            width: 201,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 43.07,
                      ),
                      Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 25.11,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              color: Color.fromRGBO(163, 18, 28, 1)),
                        ),
                      ),
                      SizedBox(
                        height: 58.04,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          51.07,
                          0,
                          238.56,
                          11.72,
                        ),
                        child: Text(
                          "Name",
                          style: TextStyle(
                            fontFamily: "Mulish",
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(53, 53, 53, 1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          36.84,
                          0,
                          36.84,
                          0,
                        ),
                        child: Container(
                          height: 42,
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.name,
                            onSaved: (input) => signUpRequest.name = input,
                            validator: (input) => input.length < 3
                                ? "Name should be more than 3 characters"
                                : null,
                            textAlignVertical: TextAlignVertical.bottom,
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
                        padding: const EdgeInsets.fromLTRB(
                          51.07,
                          20,
                          238.56,
                          11.72,
                        ),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontFamily: "Mulish",
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(53, 53, 53, 1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          36.84,
                          0,
                          36.84,
                          0,
                        ),
                        child: Container(
                          height: 42,
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            textAlign: TextAlign.left,
                            validator: (input) => !input.contains('@')
                                ? "Email Id should be valid"
                                : null,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) => signUpRequest.email = input,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefix: Text("    "),
                                hintText: "email",
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
                        padding: const EdgeInsets.fromLTRB(
                          51.07,
                          20,
                          238.56,
                          11.72,
                        ),
                        child: Text(
                          "Mobile Number",
                          style: TextStyle(
                            fontFamily: "Mulish",
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(53, 53, 53, 1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          36.84,
                          0,
                          36.84,
                          0,
                        ),
                        child: Container(
                          height: 42,
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            textAlign: TextAlign.left,
                            validator: (input) => input.length < 10
                                ? "Phone Number should be equal to 10 digits"
                                : null,
                            keyboardType: TextInputType.number,
                            controller: _phoneController,
                            onSaved: (input) =>
                                signUpRequest.phoneNumber = input,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefix: Text("    "),
                                hintText: "Phone",
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
                        padding: const EdgeInsets.fromLTRB(
                          51.07,
                          20,
                          238.56,
                          11.72,
                        ),
                        child: Text(
                          "Password",
                          style: TextStyle(
                            fontFamily: "Mulish",
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(53, 53, 53, 1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          36.84,
                          0,
                          36.84,
                          0,
                        ),
                        child: Container(
                          height: 42,
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            textAlign: TextAlign.left,
                            obscureText: true,
                            validator: (input) => input.length < 3
                                ? "Password should be more than 3 characters"
                                : null,
                            keyboardType: TextInputType.text,
                            onSaved: (input) => signUpRequest.password = input,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefix: Text("    "),
                                hintText: "Password",
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
                        padding:
                            const EdgeInsets.fromLTRB(36.84, 22.6, 36.84, 0),
                        child: Container(
                          width: 380.32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.18)),
                          height: 37.66,
                          child: FlatButton(
                            onPressed: () {
                              if (validateAndSave()) {
                                print(signUpRequest.toJson());
                                apiCall();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OTPScreen(
                                              otpId: otpId,
                                              phoneNumber:
                                                  _phoneController.text,
                                            )));
                              } else {
                                print("Authentication Failed");
                              }
                              // ? apiCall()
                              // : print("Everything Failed");
                            },
                            child: Text(
                              "Get OTP",
                              style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Color.fromRGBO(
                                  255,
                                  255,
                                  255,
                                  1,
                                ),
                              ),
                            ),
                            color: Color.fromRGBO(
                              163,
                              18,
                              28,
                              1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 47.24),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(33.93, 0, 33.93, 45.9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "By signing in you agree to our",
                              style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 12.35,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: Color(0xfbb757474),
                                letterSpacing: 1.0,
                              ),
                            ),
                            TextButton(
                              child: Text(
                                "terms and conditions",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontSize: 12.35,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromRGBO(163, 18, 28, 1),
                                  letterSpacing: 1.0,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      )
                    ],
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
