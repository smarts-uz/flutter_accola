// To parse this JSON data, do
//
//     final resp123 = resp123FromJson(jsonString);

import 'dart:convert';

Resp123 resp123FromJson(String str) => Resp123.fromJson(json.decode(str));

String resp123ToJson(Resp123 data) => json.encode(data.toJson());

class Resp123 {
  Resp123({
    this.data,
  });

  List<Datum> data;

  factory Resp123.fromJson(Map<String, dynamic> json) => Resp123(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.datum,
    this.empty,
    this.purple,
  });

  String datum;
  String empty;
  String purple;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    datum: json["Сотрудник"],
    empty: json["Должность"],
    purple: json["Сумма"],
  );

  Map<String, dynamic> toJson() => {
    "Сотрудник": datum,
    "Должность": empty,
    "Сумма": purple,
  };
}
