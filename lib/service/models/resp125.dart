// To parse this JSON data, do
//
//     final resp125 = resp125FromJson(jsonString);

import 'dart:convert';

Resp125 resp125FromJson(String str) => Resp125.fromJson(json.decode(str));

String resp125ToJson(Resp125 data) => json.encode(data.toJson());

class Resp125 {
  Resp125({
    this.data,
  });

  List<Datum> data;

  factory Resp125.fromJson(Map<String, dynamic> json) => Resp125(
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
    this.fluffy,
    this.purple,
  });

  String datum;
  String empty;
  String fluffy;
  String purple;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    datum: json["Контрагент"],
    empty: json["Договор"],
    fluffy: json["СуммаОстаток"] == null ? null : json["СуммаОстаток"],
    purple: json["Сумма"] == null ? null : json["Сумма"],
  );

  Map<String, dynamic> toJson() => {
    "Контрагент": datum,
    "Договор": empty,
    "СуммаОстаток": fluffy == null ? null : fluffy,
    "Сумма": purple == null ? null : purple,
  };
}
