// To parse this JSON data, do
//
//     final categoryDetailRequest = categoryDetailRequestFromJson(jsonString);

import 'dart:convert';

CategoryDetailRequest categoryDetailRequestFromJson(String str) =>
    CategoryDetailRequest.fromJson(json.decode(str));

String categoryDetailRequestToJson(CategoryDetailRequest data) =>
    json.encode(data.toJson());

class CategoryDetailRequest {
  String categoryId;
  String page;

  CategoryDetailRequest({
    required this.categoryId,
    required this.page,
  });

  factory CategoryDetailRequest.fromJson(Map<String, dynamic> json) =>
      CategoryDetailRequest(
        categoryId: json["category_id"],
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "page": page,
      };
}
