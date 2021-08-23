import 'package:http/http.dart' as http;
import 'package:meatwow/models/signup_model.dart';
import 'dart:convert';

class APIService {
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest) async {
    Uri uri = Uri.http('localhost:5000', '/auth/signup-phone');

    final response = await http.post(
      uri,
      body: jsonEncode(signUpRequest),
      headers: {
        "Content-Type": "application/json",
        "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg"
      },
    );

    if (response.body.isNotEmpty) {
      return SignUpResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Data ");
    }
  }
}
