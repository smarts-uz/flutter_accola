import 'dart:convert';

class LoginResponseModel {
  bool status;
  AuthModel auth;

  LoginResponseModel({this.status, this.auth});

  LoginResponseModel copyWith(
    bool status,
    AuthModel auth,
  ) =>
      LoginResponseModel(
        status: status ?? this.status,
        auth: auth ?? this.auth,
      );

  factory LoginResponseModel.fromJson(String str) =>
      LoginResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromMap(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["status"],
        auth: json["auth"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "auth": auth,
      };
}

class AuthModel {
  final String username;
  final String role;
  final List<BaseModel> base;

  AuthModel({this.username, this.role, this.base});

  AuthModel copyWith(
    String username,
    String role,
    List<BaseModel> base,
  ) =>
      AuthModel(
        username: username ?? this.username,
        role: role ?? this.role,
        base: base ?? this.base,
      );

  factory AuthModel.fromJson(String str) => AuthModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthModel.fromMap(Map<String, dynamic> json) => AuthModel(
        username: json["username"],
        role: json["role"],
        base:
            List<BaseModel>.from(json["base"].map((x) => BaseModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "role": role,
        "base": List<dynamic>.from(base.map((x) => x.toMap())),
      };
}

class BaseModel {
  final String basename;
  final String baseID;
  final String login;
  final String password;

  BaseModel({this.basename, this.baseID, this.login, this.password});

  BaseModel copyWith(
    String basename,
    String baseID,
    String login,
    String password,
  ) =>
      BaseModel(
        basename: basename ?? this.basename,
        baseID: baseID ?? this.baseID,
        login: login ?? this.login,
        password: password ?? this.password,
      );

  factory BaseModel.fromJson(String str) => BaseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BaseModel.fromMap(Map<String, dynamic> json) => BaseModel(
        basename: json["basename"],
        baseID: json["baseID"],
        login: json["login"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "basename": basename,
        "baseID": baseID,
        "login": login,
        "password": password,
      };
}
