// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  bool success;
  Dataa data;

  LoginResponse({
    required this.success,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    success: json["success"],
    data: Dataa.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Dataa {
  Response response;

  Dataa({
    required this.response,
  });

  factory Dataa.fromJson(Map<String, dynamic> json) => Dataa(
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response.toJson(),
  };
}

class Response {
  int code;
  String message;
  Modell model;

  Response({
    required this.code,
    required this.message,
    required this.model,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    code: json["code"],
    message: json["message"],
    model: Modell.fromJson(json["model"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "model": model.toJson(),
  };
}

class Modell {
  String token;
  String email;
  String firstname;
  String lastname;

  Modell({
    required this.token,
    required this.email,
    required this.firstname,
    required this.lastname,
  });

  factory Modell.fromJson(Map<String, dynamic> json) => Modell(
    token: json["token"],
    email: json["email"],
    firstname: json["firstname"],
    lastname: json["lastname"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "email": email,
    "firstname": firstname,
    "lastname": lastname,
  };
}
