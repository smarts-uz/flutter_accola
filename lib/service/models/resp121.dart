// To parse this JSON data, do
//
//     final resp121 = resp121FromJson(jsonString);

import 'dart:convert';

Resp121 resp121FromJson(String str) => Resp121.fromJson(json.decode(str));

String resp121ToJson(Resp121 data) => json.encode(data.toJson());

class Resp121 {
  Resp121({
    this.data,
  });

  List<Datum> data;

  factory Resp121.fromJson(Map<String, dynamic> json) => Resp121(
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
        datum: json["ОС"],
        empty: json["КоличествоОстаток"],
        purple: json["СуммаОстаток"],
      );

  Map<String, dynamic> toJson() => {
        "ОС": datum,
        "КоличествоОстаток": empty,
        "СуммаОстаток": purple,
      };
}
