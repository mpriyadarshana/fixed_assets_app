// To parse this JSON data, do
//
//     final newLoginRequest = newLoginRequestFromJson(jsonString);

import 'dart:convert';

NewLoginRequest newLoginRequestFromJson(String str) => NewLoginRequest.fromJson(json.decode(str));

String newLoginRequestToJson(NewLoginRequest data) => json.encode(data.toJson());

class NewLoginRequest {
  String email;
  String password;

  NewLoginRequest({
    required this.email,
    required this.password,
  });

  factory NewLoginRequest.fromJson(Map<String, dynamic> json) => NewLoginRequest(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
