// To parse this JSON data, do
//
//     final cProfileRequest = cProfileRequestFromJson(jsonString);

import 'dart:convert';

CProfileRequest cProfileRequestFromJson(String str) =>
    CProfileRequest.fromJson(json.decode(str));

String cProfileRequestToJson(CProfileRequest data) =>
    json.encode(data.toJson());

class CProfileRequest {
  String firstname;
  String lastname;
  String email;

  CProfileRequest({
    required this.firstname,
    required this.lastname,
    required this.email,
  });

  factory CProfileRequest.fromJson(Map<String, dynamic> json) =>
      CProfileRequest(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
      };
}
