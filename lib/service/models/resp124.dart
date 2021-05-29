// To parse this JSON data, do
//
//     final resp124 = resp124FromJson(jsonString);

import 'dart:convert';

Resp124 resp124FromJson(String str) => Resp124.fromJson(json.decode(str));

String resp124ToJson(Resp124 data) => json.encode(data.toJson());

class Resp124 {
  Resp124({
    this.data,
  });

  List<Datum> data;

  factory Resp124.fromJson(Map<String, dynamic> json) => Resp124(
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
    datum: json["Контрагент"],
    empty: json["Договор"],
    purple: json["СуммаОстаток"],
  );

  Map<String, dynamic> toJson() => {
    "Контрагент": datum,
    "Договор": empty,
    "СуммаОстаток": purple,
  };
}
