class SignUpResponse {
  final bool msg;
  String otpId;

  SignUpResponse({
    this.msg,
    this.otpId,
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
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
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
