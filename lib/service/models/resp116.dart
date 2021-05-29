// To parse this JSON data, do
//
//     final resp116 = resp116FromJson(jsonString);

import 'dart:convert';

Resp116 resp116FromJson(String str) => Resp116.fromJson(json.decode(str));

String resp116ToJson(Resp116 data) => json.encode(data.toJson());

class Resp116 {
  Resp116({
    this.data,
  });

  List<Datum> data;

  factory Resp116.fromJson(Map<String, dynamic> json) => Resp116(
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
        purple: json["Сырье"],
        empty: json["КоличествоОстаток"],
        datum: json["СуммаОстаток"],
      );

  Map<String, dynamic> toJson() => {
        "Сырье": purple,
        "КоличествоОстаток": empty,
        "СуммаОстаток": datum,
      };
}
