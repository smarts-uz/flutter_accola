import 'dart:convert';

class TypeResponseModel {

  final List<DataModel> data;

  TypeResponseModel({ this.data});

  TypeResponseModel copyWith(List<DataModel> data,) =>
      TypeResponseModel(
        data: data ?? this.data,
      );

  factory TypeResponseModel.fromJson(String str) =>
      TypeResponseModel.fromMap(json.decode(str));


  String toJson() => json.encode(toMap());

  factory TypeResponseModel.fromMap(Map<String, dynamic> json) =>
      TypeResponseModel(
        data: List<DataModel>.from(json["data"].map((x)=>DataModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() =>
      {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class DataModel {
  final String BankovskiySchet;
  final String SummaOstatok;

  DataModel({this.BankovskiySchet, this.SummaOstatok});

  DataModel copyWith(String BankovskiySchet, String SummaOstatok) =>
      DataModel(
        BankovskiySchet: BankovskiySchet ?? this.BankovskiySchet,
        SummaOstatok: SummaOstatok ?? this.SummaOstatok,
      );


  factory DataModel.fromJson(String str) => DataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataModel.fromMap(Map<String, dynamic> json) =>
      DataModel(
        BankovskiySchet: json["BankovskiySchet"],
        SummaOstatok: json["SummaOstatok"],
      );

  Map<String, dynamic> toMap() =>
      {
        "username": BankovskiySchet,
        "role": SummaOstatok,
      };
}