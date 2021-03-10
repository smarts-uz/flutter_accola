import 'dart:convert';

class LoginRequestModel {
  final AuthModel auth;

  LoginRequestModel({this.auth});

  LoginRequestModel copyWith({
    AuthModel auth,
  }) =>
      LoginRequestModel(
        auth: auth ?? this.auth,
      );

  factory LoginRequestModel.fromJson(String str) =>
      LoginRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromMap(Map<String, dynamic> json) =>
      LoginRequestModel(
        auth: AuthModel.fromMap(
          json["auth"],
        ),
      );

  Map<String, dynamic> toMap() => {
        "auth": auth.toMap(),
      };
}

class AuthModel {
  final String login;
  final String password;

  AuthModel({this.login, this.password});

  AuthModel copyWith({
    String login,
    String password,
  }) =>
      AuthModel(
        login: login ?? this.login,
        password: password ?? this.password,
      );

  factory AuthModel.fromJson(String str) => AuthModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthModel.fromMap(Map<String, dynamic> json) => AuthModel(
        login: json["login"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "login": login,
        "password": password,
      };
}
