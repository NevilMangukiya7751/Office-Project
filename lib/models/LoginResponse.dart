// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String success;
  String apiToken;

  LoginResponse({
    required this.success,
    required this.apiToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        apiToken: json["api_token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "api_token": apiToken,
      };
}
