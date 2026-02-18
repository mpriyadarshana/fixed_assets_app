// To parse this JSON data, do
//
//     final verificationListResponse = verificationListResponseFromJson(jsonString);

import 'dart:convert';
import 'dart:core';

import 'package:fixed_assets_app/features/data/models/group/location_group.dart';

import '../model/asset.dart';

VerificationListResponse verificationListResponseFromJson(String str) => VerificationListResponse.fromJson(json.decode(str));

String verificationListResponseToJson(VerificationListResponse data) => json.encode(data.toJson());
String locationGroupToJson(LocationGroup data) => json.encode(data.toJson());

class VerificationListResponse {
  bool success;
  List<dynamic> data;
  List<dynamic> errors;

  VerificationListResponse({
    required this.success,
    required this.data,
    required this.errors,
  });

  factory VerificationListResponse.fromJson(Map<String, dynamic> json) => VerificationListResponse(
    success: json["success"],
    data: List<LocationGroup>.from(
      json["data"].map((x) => LocationGroup.fromJson(x)),
    ),
    //data: List<Asset>.from(json["data"].map((x) => Asset.fromJson(x))),
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "errors": List<dynamic>.from(errors.map((x) => x)),
  };
}