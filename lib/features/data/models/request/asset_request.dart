import 'dart:convert';

AssetRequest assetRequestFromJson(String str) => AssetRequest.fromJson(json.decode(str));

String assetRequestToJson(AssetRequest data) => json.encode(data.toJson());

class AssetRequest {
  Data data;

  AssetRequest({
    required this.data,
  });

  factory AssetRequest.fromJson(Map<String, dynamic> json) => AssetRequest(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  int itemId;
  String verification;
  String username;
  String date;
  String remarks;

  Data({
    required this.itemId,
    required this.verification,
    required this.username,
    required this.date,
    required this.remarks,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    itemId: json["item_id"],
    verification: json["verification"],
    username: json["username"],
    date: json["date"],
    remarks: json["remarks"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "verification": verification,
    "username": username,
    "date": date,
    "remarks": remarks,
  };
}
