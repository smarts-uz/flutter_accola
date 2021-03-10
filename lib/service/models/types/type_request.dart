import 'dart:convert';

class TypeRequestModel {
  final AuthModel auth;
  final DataModel data;

  TypeRequestModel({this.auth, this.data});

  TypeRequestModel copyWith({
    AuthModel auth,
    DataModel data,
  }) =>
      TypeRequestModel(
        auth: auth ?? this.auth,
        data: data ?? this.data,
      );

  factory TypeRequestModel.fromJson(String str) =>
      TypeRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TypeRequestModel.fromMap(Map<String, dynamic> json) =>
      TypeRequestModel(
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
  final String date;

  DataModel({this.type, this.date});

  DataModel copyWith({
    int type,
    String date,
  }) =>
      DataModel(
        type: type ?? this.type,
        date: date ?? this.date,
      );

  factory DataModel.fromJson(String str) => DataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataModel.fromMap(Map<String, dynamic> json) => DataModel(
        type: json["type"],
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "date": date,
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
