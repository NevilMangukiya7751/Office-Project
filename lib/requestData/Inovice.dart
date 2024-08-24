// To parse this JSON data, do
//
//     final inoviceRequest = inoviceRequestFromJson(jsonString);

import 'dart:convert';

InoviceRequest inoviceRequestFromJson(String str) =>
    InoviceRequest.fromJson(json.decode(str));

String inoviceRequestToJson(InoviceRequest data) => json.encode(data.toJson());

class InoviceRequest {
  String customerName;
  String date;
  List<dynamic> item;

  InoviceRequest({
    required this.customerName,
    required this.date,
    required this.item,
  });

  factory InoviceRequest.fromJson(Map<String, dynamic> json) => InoviceRequest(
        customerName: json["customer_name"],
        date: json["date"],
        item: List<dynamic>.from(json["item"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "customer_name": customerName,
        "date": date,
        "item": List<dynamic>.from(item.map((x) => x)),
      };
}
