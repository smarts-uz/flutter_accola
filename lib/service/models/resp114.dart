// To parse this JSON data, do
//
//     final resp114 = resp114FromJson(jsonString);

import 'dart:convert';

Resp114 resp114FromJson(String str) => Resp114.fromJson(json.decode(str));

String resp114ToJson(Resp114 data) => json.encode(data.toJson());

class Resp114 {
  Resp114({
    this.data,
  });

  List<Datum> data;

  factory Resp114.fromJson(Map<String, dynamic> json) => Resp114(
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
  });

  String datum;
  String empty;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        datum: json["СырьеМатериалы"],
        empty: json["СуммаОстаток"],
      );

  Map<String, dynamic> toJson() => {
        "СырьеМатериалы": datum,
        "СуммаОстаток": empty,
      };
}
