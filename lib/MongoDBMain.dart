import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) => MongoDbModel.fromJson(json.decode(str));
String mongoDbModeltoJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel{


  MongoDbModel({
    required this.Block,
    required this.District,
    required this.Panchayat,
    required this.Stage,
    required this.State,
    required this.AssetCategory,
    required this.AssetSub,
});

  //ObjectId id;
  String Block;
  String District;
  String Panchayat;
  String Stage;
  String State;
  String AssetCategory;
  String AssetSub;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
      Block: json["Block"],
      District :json["District"],
      Panchayat: json["Panchayat"],
      Stage: json["Stage"],
      State: json["State"],
      AssetCategory: json["AssetCategory"],
      AssetSub: json["AssetSub"],
  );

  Map<String, dynamic> toJson() => {
    "Block" : Block,
    "District" : District,
    "Panchayat" : Panchayat,
    "Stage" : Stage,
    "State" : State,
    "AssetCategory" : AssetCategory,
    "AssetSub" : AssetSub,
  };

}