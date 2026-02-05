import 'dart:convert';

VerifyItemRequest verifyItemRequestFromJson(String str) => VerifyItemRequest.fromJson(json.decode(str));

String verifyItemRequestToJson(VerifyItemRequest data) => json.encode(data.toJson());

class VerifyItemRequest {
  Data data;

  VerifyItemRequest({
    required this.data,
  });

  factory VerifyItemRequest.fromJson(Map<String, dynamic> json) => VerifyItemRequest(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  int itemId;
  String verification;
  String date;
  String remarks;

  Data({
    required this.itemId,
    required this.verification,
    required this.date,
    required this.remarks,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    itemId: json["item_id"],
    verification: json["verification"],
    date: json["date"],
    remarks: json["remarks"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "verification": verification,
    "date": date,
    "remarks": remarks,
  };
}
