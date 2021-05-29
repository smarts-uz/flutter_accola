// To parse this JSON data, do
//
//     final resp115 = resp115FromJson(jsonString);

import 'dart:convert';

Resp115 resp115FromJson(String str) => Resp115.fromJson(json.decode(str));

String resp115ToJson(Resp115 data) => json.encode(data.toJson());

class Resp115 {
  Resp115({
    this.data,
  });

  List<Datum> data;

  factory Resp115.fromJson(Map<String, dynamic> json) => Resp115(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.purple,
    this.empty,
    this.datum,
  });

  String purple;
  String empty;
  String datum;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    purple: json["Товар"],
    empty: json["КоличествоОстаток"],
    datum: json["СуммаОстаток"],
  );

  Map<String, dynamic> toJson() => {
    "Товар": purple,
    "КоличествоОстаток": empty,
    "СуммаОстаток": datum,
  };
}
