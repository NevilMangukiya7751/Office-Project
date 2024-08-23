// To parse this JSON data, do
//
//     final logOutResponse = logOutResponseFromJson(jsonString);

import 'dart:convert';

LogOutResponse logOutResponseFromJson(String str) =>
    LogOutResponse.fromJson(json.decode(str));

String logOutResponseToJson(LogOutResponse data) => json.encode(data.toJson());

class LogOutResponse {
  bool success;

  LogOutResponse({
    required this.success,
  });

  factory LogOutResponse.fromJson(Map<String, dynamic> json) => LogOutResponse(
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}
