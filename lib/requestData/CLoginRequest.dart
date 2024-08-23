// To parse this JSON data, do
//
//     final cLoginRequest = cLoginRequestFromJson(jsonString);

import 'dart:convert';

CLoginRequest cLoginRequestFromJson(String str) =>
    CLoginRequest.fromJson(json.decode(str));

String cLoginRequestToJson(CLoginRequest data) => json.encode(data.toJson());

class CLoginRequest {
  String email;
  String password;

  CLoginRequest({
    required this.email,
    required this.password,
  });

  factory CLoginRequest.fromJson(Map<String, dynamic> json) => CLoginRequest(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
