// To parse this JSON data, do
//
//     final assetsDetailsResponse = assetsDetailsResponseFromJson(jsonString);

import 'dart:convert';

import '../model/asset.dart';

AssetsDetailsResponse assetsDetailsResponseFromJson(String str) => AssetsDetailsResponse.fromJson(json.decode(str));

String assetsDetailsResponseToJson(AssetsDetailsResponse data) => json.encode(data.toJson());
String assetToJson(Asset data) => json.encode(data.toJson());

class AssetsDetailsResponse {
  bool success;
  List<Asset> data;
  List<dynamic> errors;

  AssetsDetailsResponse({
    required this.success,
    required this.data,
    required this.errors,
  });

  factory AssetsDetailsResponse.fromJson(Map<String, dynamic> json) => AssetsDetailsResponse(
    success: json["success"],
    data: List<Asset>.from(json["data"].map((x) => Asset.fromJson(x))),
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "errors": List<dynamic>.from(errors.map((x) => x)),
  };
}