// To parse this JSON data, do
//
//     final addToCartRequest = addToCartRequestFromJson(jsonString);

import 'dart:convert';

AddToCartRequest addToCartRequestFromJson(String str) =>
    AddToCartRequest.fromJson(json.decode(str));

String addToCartRequestToJson(AddToCartRequest data) =>
    json.encode(data.toJson());

class AddToCartRequest {
  String productId;
  String quantuty;

  AddToCartRequest({
    required this.productId,
    required this.quantuty,
  });

  factory AddToCartRequest.fromJson(Map<String, dynamic> json) =>
      AddToCartRequest(
        productId: json["product_id"],
        quantuty: json["quantuty"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantuty": quantuty,
      };
}
