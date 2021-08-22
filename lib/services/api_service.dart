import 'package:http/http.dart' as http;
import 'package:meatwow/models/signup_model.dart';
import 'dart:convert';

class APIService {
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest) async {
    String url = "http://localhost:5000/auth/signup-phone";

    Uri uri = Uri.dataFromString(url);

    final response = await http.post(uri, body: signUpRequest.toJson());

    if (response.body.isNotEmpty) {
      return SignUpResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Data ");
    }
  }
}
