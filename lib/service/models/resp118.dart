// To parse this JSON data, do
//
//     final resp118 = resp118FromJson(jsonString);

import 'dart:convert';

Resp118 resp118FromJson(String str) => Resp118.fromJson(json.decode(str));

String resp118ToJson(Resp118 data) => json.encode(data.toJson());

class Resp118 {
  Resp118({
    this.data,
  });

  List<Datum> data;

  factory Resp118.fromJson(Map<String, dynamic> json) => Resp118(
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
        purple: json["Контрагент"],
        empty: json["Договор"],
        datum: json["СуммаОстаток"],
      );

  Map<String, dynamic> toJson() => {
        "Контрагент": purple,
        "Договор": empty,
        "СуммаОстаток": datum,
      };
}
