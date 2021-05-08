// To parse this JSON data, do
//
//     final resp111 = resp111FromJson(jsonString);

import 'dart:convert';

Resp111 resp111FromJson(String str) => Resp111.fromJson(json.decode(str));

String resp111ToJson(Resp111 data) => json.encode(data.toJson());

class Resp111 {
  Resp111({
    this.data,
  });

  List<Datum> data;

  factory Resp111.fromJson(Map<String, dynamic> json) => Resp111(
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
