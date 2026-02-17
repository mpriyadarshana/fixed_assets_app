// To parse this JSON data, do
//
//     final verificationListResponse = verificationListResponseFromJson(jsonString);

import 'dart:convert';

VerificationListResponse verificationListResponseFromJson(String str) => VerificationListResponse.fromJson(json.decode(str));

String verificationListResponseToJson(VerificationListResponse data) => json.encode(data.toJson());
String datumToJson(Datum data) => json.encode(data.toJson());

class VerificationListResponse {
  bool success;
  List<Datum> data;
  List<dynamic> errors;

  VerificationListResponse({
    required this.success,
    required this.data,
    required this.errors,
  });

  factory VerificationListResponse.fromJson(Map<String, dynamic> json) => VerificationListResponse(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "errors": List<dynamic>.from(errors.map((x) => x)),
  };
}

class Datum {
  final int id;
  final int? scatId;
  final DateTime date;
  final int? year;
  final String? pvjv;
  final int? grnId;
  final String? description;
  final String? brand;
  final String? model;
  final String? serialNo;
  final String? issueNo;
  final int? price;
  final int? days;
  final String? code;
  final int typeId;
  final int? stypeId;
  final String? imagePath;
  final int? userId;
  final int ilocationId;
  final int? islocationId;

  Datum({
    required this.id,
    this.scatId,
    required this.date,
    this.year,
    this.pvjv,
    this.grnId,
    this.description,
    this.brand,
    this.model,
    this.serialNo,
    this.issueNo,
    this.price,
    this.days,
    this.code,
    required this.typeId,
    this.stypeId,
    this.imagePath,
    this.userId,
    required this.ilocationId,
    this.islocationId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'],
    scatId: json['scat_id'],
    date: DateTime.parse(json["date"]),
    year: json['year'],
    pvjv: json['pvjv'],
    grnId: json['grn_id'],
    description: json['description'],
    brand: json['brand'],
    model: json['model'],
    serialNo: json['serial_no'],
    issueNo: json['issue_no'],
    price: json['price'],
    days: json['days'],
    code: json['code'],
    typeId: json['type_id'],
    stypeId: json['stype_id'],
    imagePath: json['image_path'],
    userId: json['user_id'],
    ilocationId: json['ilocation_id'],
    islocationId: json['islocation_id'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'scat_id': scatId,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'year': year,
    'pvjv': pvjv,
    'grn_id': grnId,
    'description': description,
    'brand': brand,
    'model': model,
    'serial_no': serialNo,
    'issue_no': issueNo,
    'price': price,
    'days': days,
    'code': code,
    'type_id': typeId,
    'stype_id': stypeId,
    'image_path': imagePath,
    'user_id': userId,
    'ilocation_id': ilocationId,
    'islocation_id': islocationId,
  };
}
