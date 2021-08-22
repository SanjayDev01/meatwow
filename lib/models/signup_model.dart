class SignUpResponse {
  final String msg;
  final String otpId;

  SignUpResponse({
    required this.msg,
    required this.otpId,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      msg: json["msg"],
      otpId: json["otpId"],
    );
  }
}

class SignUpRequest {
  String name;
  String email;
  String phoneNumber;
  String password;

  SignUpRequest({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name.trim(),
      'email': email.trim(),
      'phoneNumber': phoneNumber.trim(),
      'password': password.trim(),
    };
    return map;
  }
}
