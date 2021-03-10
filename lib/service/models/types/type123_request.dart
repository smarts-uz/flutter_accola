import 'dart:convert';

class Type123RequestModel {
  final AuthModel auth;
  final DataModel data;

  Type123RequestModel({this.auth, this.data});

  Type123RequestModel copyWith({
    AuthModel auth,
    DataModel data,
  }) =>
      Type123RequestModel(
        auth: auth ?? this.auth,
        data: data ?? this.data,
      );

  factory Type123RequestModel.fromJson(String str) =>
      Type123RequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Type123RequestModel.fromMap(Map<String, dynamic> json) =>
      Type123RequestModel(
        auth: AuthModel.fromMap(
          json["auth"],
        ),
        data: DataModel.fromMap(
          json["data"],
        ),
      );

  Map<String, dynamic> toMap() => {
        "auth": auth.toMap(),
        "data": data.toMap(),
      };
}

class DataModel {
  final int type;
  final String dateN;
  final String dateK;

  DataModel({
    this.type,
    this.dateN,
    this.dateK,
  });

  DataModel copyWith({
    int type,
    String dateN,
    String dateK,
  }) =>
      DataModel(
        type: type ?? this.type,
        dateN: dateN ?? this.dateN,
        dateK: dateK ?? this.dateK,
      );

  factory DataModel.fromJson(String str) => DataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataModel.fromMap(Map<String, dynamic> json) => DataModel(
        type: json["type"],
        dateN: json["dateN"],
        dateK: json["dateK"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "dateN": dateN,
        "dateK": dateK,
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
