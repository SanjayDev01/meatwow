class SignInRequest {
  String phoneNumber;
  String password;

  SignInRequest({
    this.phoneNumber,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'phoneNumber': phoneNumber.trim(),
      'password': password.trim(),
    };
    return map;
  }
}
