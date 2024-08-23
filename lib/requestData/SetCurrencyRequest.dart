// To parse this JSON data, do
//
//     final setCurrencyRequest = setCurrencyRequestFromJson(jsonString);

import 'dart:convert';

SetCurrencyRequest setCurrencyRequestFromJson(String str) =>
    SetCurrencyRequest.fromJson(json.decode(str));

String setCurrencyRequestToJson(SetCurrencyRequest data) =>
    json.encode(data.toJson());

class SetCurrencyRequest {
  String currency;

  SetCurrencyRequest({
    required this.currency,
  });

  factory SetCurrencyRequest.fromJson(Map<String, dynamic> json) =>
      SetCurrencyRequest(
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
      };
}
