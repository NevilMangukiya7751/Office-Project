// To parse this JSON data, do
//
//     final productDetailsRequest = productDetailsRequestFromJson(jsonString);

import 'dart:convert';

ProductDetailsRequest productDetailsRequestFromJson(String str) =>
    ProductDetailsRequest.fromJson(json.decode(str));

String productDetailsRequestToJson(ProductDetailsRequest data) =>
    json.encode(data.toJson());

class ProductDetailsRequest {
  String productId;

  ProductDetailsRequest({
    required this.productId,
  });

  factory ProductDetailsRequest.fromJson(Map<String, dynamic> json) =>
      ProductDetailsRequest(
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
      };
}
