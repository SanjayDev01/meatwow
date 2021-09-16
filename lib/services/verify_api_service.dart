// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:meatwow/config/uri.dart';
import 'package:meatwow/models/verify.dart';
import 'package:meatwow/shared/token.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class VerifyAPIService {
  Future<VerifyResponse> signUp(VerifyRequest verifyRequest) async {
    String apiUrl = Ur().uri;

    String url = '$apiUrl/auth/check-otp-and-signin';

    final response = await Dio().post(
      url,
      data: jsonEncode(verifyRequest),
      options: Options(headers: {
        "Content-Type": "application/json",
        "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg"
      }),
    );
    // final headers = json.decode(json.encode(response.headers['set-cookie']));
    // //final accessToken = headers.split(',')[0];
    // // String s = "date   :   '2019:04:01'";
    // int idx = headers.indexOf("e,");
    // List parts = [
    //   headers.substring(0, idx).trim(),
    //   headers.substring(idx + 1).trim(),
    //   headers.substring(idx + 2).trim()
    // ];
    // print(parts[2]);
    // print(parts[0]);

    // // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // // bool result = await sharedPreferences.setString('user', parts[2]);
    // // print(result);
    // // print(json.encode(parts[2]));
    // print(headers);
    // if (headers != null) {
    //   // Map tokens = TokenHelper.getTokens(headers);
    //   if (headers != null) {
    //     //  Map tokens = TokenHelper.getTokens(headers);
    //     SharedPreferences prefs = await SharedPreferences.getInstance();
    //     prefs.setString("c_refToken", parts[0]);
    //     prefs.setString("c_access_token", parts[2]);
    //     // print(tokens);
    //   }
    // }
    print(response.headers['set-cookie']);
    if (response.headers['set-cookie'] != null) {
      Map tokens = TokenHelper.getTokens(response.headers['set-cookie']);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('c_refToken', tokens["c_refToken"]);
      prefs.setString("c_access_token", tokens["c_access_token"]);
      print(tokens);
    }

    if (response.data.isNotEmpty) {
      return VerifyResponse.fromJson(response.data);
    } else {
      throw Exception("Failed to load Data ");
    }
  }
}
