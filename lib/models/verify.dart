import 'user.dart';

class VerifyResponse {
  final bool msg;
  final dynamic user;

  VerifyResponse({this.msg, this.user});

  factory VerifyResponse.fromJson(Map<String, dynamic> parsedJson) {
    // var user = parsedJson['user'] as Map;
    //         Map<User> users = user.map((i) => User.fromJson(i));

    return VerifyResponse(
      msg: parsedJson['msg'],
      user: User.fromJson(parsedJson['user']),
    );
  }
}

class VerifyRequest {
  String otp;
  String otpId;
  String phoneNumber;

  VerifyRequest({
    this.otp,
    this.otpId,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'otp': otp.trim(),
      'otpId': otpId.trim(),
      'phoneNumber': phoneNumber.trim(),
    };
    return map;
  }
}
