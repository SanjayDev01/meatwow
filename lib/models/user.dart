import 'role.dart';

class User {
  final List<Roles> roles;
  final bool isPhoneVerified;
  final bool isEmailConfirm;
  final bool firstlogin;
  final String id;
  final String username;
  final String name;
  final String email;
  final String password;
  final String phoneNumber;

  User({
    this.id,
    this.email,
    this.firstlogin,
    this.isEmailConfirm,
    this.isPhoneVerified,
    this.name,
    this.password,
    this.phoneNumber,
    this.roles,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    //var list = parsedJson['roles'] as List;
    // List<Roles> dataList = list.map((i) => Roles.fromJson(i)).toList();

    return User(
      id: parsedJson['_id'],
      name: parsedJson['name'],
      password: parsedJson['password'],
      phoneNumber: parsedJson['phoneNumber'],
      // roles: list,
      username: parsedJson['username'],
      email: parsedJson['email'],
      isPhoneVerified: parsedJson['is_phone_verified'],
      firstlogin: parsedJson['first_login'],
      isEmailConfirm: parsedJson['isEmailConfirm'],
    );
  }
}

class SignOut {
  bool msg;

  SignOut({this.msg});

  SignOut.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
  }
}
