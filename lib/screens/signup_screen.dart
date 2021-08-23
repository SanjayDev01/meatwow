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
  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  late SignUpRequest signUpRequest;

  @override
  void initState() {
    super.initState();
    signUpRequest = SignUpRequest(
      name: _nameController.text,
      email: _emailController.text,
      phoneNumber: _phoneController.text,
      password: _passwordController.text,
    );
  }

  bool validated = false;

  apiCall() {
    APIService apiService = APIService();
    apiService.signUp(signUpRequest).then((value) {
      if (value.otpId.isNotEmpty) {
        print(value.otpId);
      } else {
        print("No OTP Id");
      }
    });
  }

  validateFields(context) {
    if ((_nameController.text.length >= 3) &&
        (_emailController.text.characters.contains("@")) &&
        (_phoneController.text.length == 10) &&
        (_passwordController.text.length >= 3)) {
      apiCall();
      print("Validated !");
      setState(() {
        validated = true;
      });
    } else {
      final snackBar = SnackBar(content: Text('Fill the form correctly!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        validated = false;
      });
    }
    return validated;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          height: MediaQuery.of(context).size.height,
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
                          image: AssetImage("assets/images/meat-wow-logo.png"),
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
                          keyboardType: TextInputType.emailAddress,
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
                          keyboardType: TextInputType.number,
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
                          keyboardType: TextInputType.text,
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
                      padding: const EdgeInsets.fromLTRB(36.84, 22.6, 36.84, 0),
                      child: Container(
                        width: 380.32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.18)),
                        height: 37.66,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OTPScreen()));
                            // validateFields(context)
                            //     ? apiCall()
                            //     : print("Everything Failed");
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
                      padding: const EdgeInsets.fromLTRB(33.93, 0, 33.93, 45.9),
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
    );
  }
}
