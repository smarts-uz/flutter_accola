// To parse this JSON data, do
//
//     final resp122 = resp122FromJson(jsonString);

import 'dart:convert';

Resp122 resp122FromJson(String str) => Resp122.fromJson(json.decode(str));

String resp122ToJson(Resp122 data) => json.encode(data.toJson());

class Resp122 {
  Resp122({
    this.data,
  });

  List<Datum> data;

  factory Resp122.fromJson(Map<String, dynamic> json) => Resp122(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.purple,
    this.datum,
    this.empty,
  });

  String purple;
  String datum;
  String empty;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    purple: json["Сотрудник"],
    datum: json["Должность"],
    empty: json["ДатаПриемаНаРаботу"],
  );

  Map<String, dynamic> toJson() => {
    "Сотрудник": purple,
    "Должность": datum,
    "ДатаПриемаНаРаботу": empty,
  };
}
