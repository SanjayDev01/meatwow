import 'package:http/http.dart' as http;
import 'package:meatwow/models/verify.dart';
import 'dart:convert';

class VerifyAPIService {
  Future<VerifyResponse> signUp(VerifyRequest verifyRequest) async {
    Uri uri = Uri.http('localhost:5000', '/auth/check-otp-and-signin');

    final response = await http.post(
      uri,
      body: jsonEncode(verifyRequest),
      headers: {
        "Content-Type": "application/json",
        "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg"
      },
    );

    if (response.body.isNotEmpty) {
      return VerifyResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Data ");
    }
  }
}
