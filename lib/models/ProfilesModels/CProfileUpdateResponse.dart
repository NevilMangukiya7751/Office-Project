// To parse this JSON data, do
//
//     final cProfileUpdateResponse = cProfileUpdateResponseFromJson(jsonString);

import 'dart:convert';

CProfileUpdateResponse cProfileUpdateResponseFromJson(String str) =>
    CProfileUpdateResponse.fromJson(json.decode(str));

String cProfileUpdateResponseToJson(CProfileUpdateResponse data) =>
    json.encode(data.toJson());

class CProfileUpdateResponse {
  String success;

  CProfileUpdateResponse({
    required this.success,
  });

  factory CProfileUpdateResponse.fromJson(Map<String, dynamic> json) =>
      CProfileUpdateResponse(
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}
