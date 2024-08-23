// To parse this JSON data, do
//
//     final cRegisterRequest = cRegisterRequestFromJson(jsonString);

import 'dart:convert';

CRegisterRequest cRegisterRequestFromJson(String str) =>
    CRegisterRequest.fromJson(json.decode(str));

String cRegisterRequestToJson(CRegisterRequest data) =>
    json.encode(data.toJson());

class CRegisterRequest {
  String firstname;
  String lastname;
  String email;
  String password;
  String telephone;
  String agree;

  CRegisterRequest({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.telephone,
    required this.agree,
  });

  factory CRegisterRequest.fromJson(Map<String, dynamic> json) =>
      CRegisterRequest(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
        telephone: json["telephone"],
        agree: json["agree"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password": password,
        "telephone": telephone,
        "agree": agree,
      };
}
