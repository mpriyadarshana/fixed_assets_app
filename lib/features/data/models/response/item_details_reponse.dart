// To parse this JSON data, do
//
//     final itemDetailsResponse = itemDetailsResponseFromJson(jsonString);

import 'dart:convert';

import '../model/asset.dart';

ItemDetailsResponse itemDetailsResponseFromJson(String str) => ItemDetailsResponse.fromJson(json.decode(str));

String itemDetailsResponseToJson(ItemDetailsResponse data) => json.encode(data.toJson());
String assetToJson(Asset data) => json.encode(data.toJson());

class ItemDetailsResponse {
  bool success;
  List<Asset> data;
  List<dynamic> errors;

  ItemDetailsResponse({
    required this.success,
    required this.data,
    required this.errors,
  });

  factory ItemDetailsResponse.fromJson(Map<String, dynamic> json) => ItemDetailsResponse(
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