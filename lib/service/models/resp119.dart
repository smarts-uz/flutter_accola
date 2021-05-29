// To parse this JSON data, do
//
//     final resp119 = resp119FromJson(jsonString);

import 'dart:convert';

Resp119 resp119FromJson(String str) => Resp119.fromJson(json.decode(str));

String resp119ToJson(Resp119 data) => json.encode(data.toJson());

class Resp119 {
  Resp119({
    this.data,
  });

  List<Datum> data;

  factory Resp119.fromJson(Map<String, dynamic> json) => Resp119(
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
    empty: json["Кредиторы"],
    datum: json["СуммаОстаток"],
  );

  Map<String, dynamic> toJson() => {
    "Кредиторы": empty,
    "СуммаОстаток": datum,
  };
}
