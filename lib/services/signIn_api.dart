// import 'package:http/http.dart' as http;
import 'package:meatwow/models/signIn_model.dart';
import 'package:dio/dio.dart';
import 'package:meatwow/models/verify.dart';
import 'dart:convert';
import 'package:meatwow/config/uri.dart';
import 'package:meatwow/shared/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInAPIService {
  Future<VerifyResponse> signIn(SignInRequest signInRequest) async {
    String apiUrl = Ur().uri;
    //print(apiUrl);
    String url = '$apiUrl/auth/signin-phone';

    final response = await Dio().post(
      url,
      data: json.encode(signInRequest),
      options: Options(headers: {
        "Content-Type": "application/json",
        "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg"
      }),
    );

    print(response.headers['set-cookie']);
    if (response.headers['set-cookie'] != null) {
      Map tokens = TokenHelper.getTokens(response.headers['set-cookie']);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('c_refToken', tokens["c_refToken"]);
      prefs.setString("c_access_token", tokens["c_access_token"]);
      print(tokens);
    }

    // final headers = json.decode(json.encode(response.headers['set-cookie']));
    //final accessToken = headers.split(',')[0];
    // String s = "date   :   '2019:04:01'";

    // // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // // bool result = await sharedPreferences.setString('user', parts[2]);
    // // print(result);
    // // print(json.encode(parts[2]));

    // print(headers);
    // if (headers != null) {
    //   int idx = headers.indexOf(",");
    //   List parts = [
    //     headers.substring(0, idx).trim(),
    //     headers.substring(idx + 1).trim(),
    //     headers.substring(idx + 2).trim()
    //   ];
    //   print(parts[2]);
    //   print(parts[0]);
    //   //  Map tokens = TokenHelper.getTokens(headers);
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   prefs.setString("c_refToken", parts[0]);
    //   prefs.setString("c_access_token", parts[2]);
    //   // print(tokens);
    // }

    if (response.data.isNotEmpty) {
      return VerifyResponse.fromJson(response.data);
    } else {
      throw Exception("Failed to load Data ");
    }
  }
}
