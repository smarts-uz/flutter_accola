// To parse this JSON data, do
//
//     final resp112 = resp112FromJson(jsonString);

import 'dart:convert';

Resp112 resp112FromJson(String str) => Resp112.fromJson(json.decode(str));

String resp112ToJson(Resp112 data) => json.encode(data.toJson());

class Resp112 {
  Resp112({
    this.data,
  });

  List<Datum> data;

  factory Resp112.fromJson(Map<String, dynamic> json) => Resp112(
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
        empty: json["БанковскийСчет"],
        datum: json["СуммаОстаток"],
      );

  Map<String, dynamic> toJson() => {
        "БанковскийСчет": empty,
        "СуммаОстаток": datum,
      };
}
