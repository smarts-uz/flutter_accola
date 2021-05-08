// To parse this JSON data, do
//
//     final request = requestFromJson(jsonString);

import 'dart:convert';

Request requestFromJson(String str) => Request.fromJson(json.decode(str));

String requestToJson(Request data) => json.encode(data.toJson());

class Request {
  Request({
    this.auth,
    this.data,
  });

  Auth auth;
  Data data;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        auth: Auth.fromJson(json["auth"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "auth": auth.toJson(),
        "data": data.toJson(),
      };
}

class Auth {
  Auth({
    this.login,
    this.password,
  });

  String login;
  String password;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        login: json["login"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "password": password,
      };
}

class Data {
  Data({
    this.type,
    this.date,
    this.dateN,
    this.dateK,
  });

  String type;
  String date;
  String dateN;
  String dateK;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"],
        date: json["date"],
        dateN: json["dateN"],
        dateK: json["dateK"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "date": date,
        "dateN": dateN,
        "dateK": dateK,
      };
}
