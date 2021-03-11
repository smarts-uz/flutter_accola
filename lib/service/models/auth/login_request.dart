import 'dart:convert';

class LoginRequestModel {
  final AuthModels auth;

  LoginRequestModel({this.auth});

  LoginRequestModel copyWith({
    AuthModels auth,
  }) =>
      LoginRequestModel(
        auth: auth ?? this.auth,
      );

  factory LoginRequestModel.fromJson(String str) =>
      LoginRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromMap(Map<String, dynamic> json) =>
      LoginRequestModel(
        auth: AuthModels.fromMap(
          json["auth"],
        ),
      );

  Map<String, dynamic> toMap() => {
        "auth": auth.toMap(),
      };
}

class AuthModels {
  final String login;
  final String password;

  AuthModels({this.login, this.password});

  AuthModels copyWith({
    String login,
    String password,
  }) =>
      AuthModels(
        login: login ?? this.login,
        password: password ?? this.password,
      );

  factory AuthModels.fromJson(String str) => AuthModels.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthModels.fromMap(Map<String, dynamic> json) => AuthModels(
        login: json["login"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "login": login,
        "password": password,
      };
}
