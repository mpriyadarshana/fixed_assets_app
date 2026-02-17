import 'dart:convert';

VerificationListRequest verificationListRequestFromJson(String str) => VerificationListRequest.fromJson(json.decode(str));

String verificationListRequestToJson(VerificationListRequest data) => json.encode(data.toJson());

class VerificationListRequest {
  Data data;

  VerificationListRequest({
    required this.data,
  });

  factory VerificationListRequest.fromJson(Map<String, dynamic> json) => VerificationListRequest(
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
