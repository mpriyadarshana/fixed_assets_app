import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  Data data;

  LoginRequest({
    required this.data,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Request request;

  Data({
    required this.request,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    request: Request.fromJson(json["request"]),
  );

  Map<String, dynamic> toJson() => {
    "request": request.toJson(),
  };
}

class Request {
  Model model;

  Request({
    required this.model,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
    model: Model.fromJson(json["model"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model.toJson(),
  };
}

class Model {
  String email;
  String password;

  Model({
    required this.email,
    required this.password,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
