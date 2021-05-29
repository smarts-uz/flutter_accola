// To parse this JSON data, do
//
//     final resp120 = resp120FromJson(jsonString);

import 'dart:convert';

Resp120 resp120FromJson(String str) => Resp120.fromJson(json.decode(str));

String resp120ToJson(Resp120 data) => json.encode(data.toJson());

class Resp120 {
  Resp120({
    this.data,
  });

  List<Datum> data;

  factory Resp120.fromJson(Map<String, dynamic> json) => Resp120(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.kontragent,
    this.dogobor,
    this.ostatok,
  });

  String kontragent;
  String dogobor;
  String ostatok;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    kontragent: json["Контрагент"],
    dogobor: json["Договор"],
    ostatok: json["СуммаОстаток"],
  );

  Map<String, dynamic> toJson() => {
    "Контрагент": kontragent,
    "Договор": dogobor,
    "СуммаОстаток": ostatok,
  };
}
