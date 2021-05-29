// To parse this JSON data, do
//
//     final resp117 = resp117FromJson(jsonString);

import 'dart:convert';

Resp117 resp117FromJson(String str) => Resp117.fromJson(json.decode(str));

String resp117ToJson(Resp117 data) => json.encode(data.toJson());

class Resp117 {
  Resp117({
    this.data,
  });

  List<Datum> data;

  factory Resp117.fromJson(Map<String, dynamic> json) => Resp117(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.empty,
    this.datum,
  });

  String empty;
  String datum;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    empty: json["Дебеторы"],
    datum: json["СуммаОстаток"],
  );

  Map<String, dynamic> toJson() => {
    "Дебеторы": empty,
    "СуммаОстаток": datum,
  };
}
