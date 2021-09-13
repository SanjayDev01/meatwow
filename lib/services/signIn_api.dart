import 'package:http/http.dart' as http;
import 'package:meatwow/models/signIn_model.dart';
import 'package:meatwow/models/verify.dart';
import 'dart:convert';
import 'package:meatwow/config/uri.dart';
import 'package:meatwow/shared/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInAPIService {
  Future<VerifyResponse> signIn(SignInRequest signInRequest) async {
    String apiUrl = Ur().uri;
    //print(apiUrl);
    Uri uri = Uri.http('$apiUrl', '/auth/signin-phone');
    print(uri);

    final response = await http.post(
      uri,
      body: json.encode(signInRequest),
      headers: {
        "Content-Type": "application/json",
        "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg"
      },
    );
    final headers = json.decode(json.encode(response.headers['set-cookie']));
    //final accessToken = headers.split(',')[0];
    // String s = "date   :   '2019:04:01'";
    int idx = headers.indexOf("y,");
    List parts = [
      headers.substring(0, idx).trim(),
      headers.substring(idx + 1).trim(),
      headers.substring(idx + 2).trim()
    ];
    print(parts[2]);
    print(parts[0]);

    // // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // // bool result = await sharedPreferences.setString('user', parts[2]);
    // // print(result);
    // // print(json.encode(parts[2]));

    // print(headers);
    if (headers != null) {
      //  Map tokens = TokenHelper.getTokens(headers);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("c_refToken", parts[0]);
      prefs.setString("c_access_token", parts[2]);
      // print(tokens);
    }

    if (response.body.isNotEmpty) {
      return VerifyResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Data ");
    }
  }
}
