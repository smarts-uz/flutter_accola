// To parse this JSON data, do
//
//     final resp112 = resp112FromJson(jsonString);

import 'dart:convert';

Resp113 resp113FromJson(String str) => Resp113.fromJson(json.decode(str));

String resp113ToJson(Resp113 data) => json.encode(data.toJson());

class Resp113 {
  Resp113({
    this.data,
  });

  List<Datum> data;

  factory Resp113.fromJson(Map<String, dynamic> json) => Resp113(
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
        empty: json["ТоварыНаСкладе"],
        datum: json["СуммаОстаток"],
      );

  Map<String, dynamic> toJson() => {
        "ТоварыНаСкладе": empty,
        "СуммаОстаток": datum,
      };
}
