import 'role.dart';

class User {
  final List<Roles> roles;
  final bool is_Phone_Verified;
  final bool is_Email_Confirm;
  final bool first_login;
  final String id;
  final String username;
  final String name;
  final String email;
  final String password;
  final String phoneNumber;

  User({
    this.id,
    this.email,
    this.first_login,
    this.is_Email_Confirm,
    this.is_Phone_Verified,
    this.name,
    this.password,
    this.phoneNumber,
    this.roles,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['roles'] as List;
    print(list.runtimeType);
    List<Roles> dataList = list.map((i) => Roles.fromJson(i)).toList();

    return User(
      id: parsedJson['_id'],
      name: parsedJson['name'],
      password: parsedJson['password'],
      phoneNumber: parsedJson['phoneNumber'],
      roles: dataList,
      username: parsedJson['username'],
      email: parsedJson['email'],
      is_Phone_Verified: parsedJson['is_Phone_Verified'],
      first_login: parsedJson['first_login'],
      is_Email_Confirm: parsedJson['is_Email_Confirm'],
    );
  }
}
