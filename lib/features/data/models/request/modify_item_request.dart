import 'dart:convert';

ModifyItemRequest modifyItemRequestFromJson(String str) => ModifyItemRequest.fromJson(json.decode(str));

String modifyItemRequestToJson(ModifyItemRequest data) => json.encode(data.toJson());

class ModifyItemRequest {
  Datas data;

  ModifyItemRequest({
    required this.data,
  });

  factory ModifyItemRequest.fromJson(Map<String, dynamic> json) => ModifyItemRequest(
    data: Datas.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Datas {
  String id;
  String description;
  String model;
  String serialNo;

  Datas({
    required this.id,
    required this.description,
    required this.model,
    required this.serialNo,
  });

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
    id: json["id"],
    description: json["description"],
    model: json["model"],
    serialNo: json["serial_no"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "model": model,
    "serial_no": serialNo,
  };
}
