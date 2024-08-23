// To parse this JSON data, do
//
//     final DrawerResponse = DrawerResponseFromJson(jsonString);

import 'dart:convert';

DrawerResponse DrawerResponseFromJson(String str) =>
    DrawerResponse.fromJson(json.decode(str));

String DrawerResponseToJson(DrawerResponse data) => json.encode(data.toJson());

class DrawerResponse {
  bool success;
  List<Category> categories;

  DrawerResponse({
    required this.success,
    required this.categories,
  });

  factory DrawerResponse.fromJson(Map<String, dynamic> json) => DrawerResponse(
        success: json["success"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  String categoryId;
  String name;
  List<Child> children;
  dynamic column;
  String href;

  Category({
    required this.categoryId,
    required this.name,
    required this.children,
    required this.column,
    required this.href,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        name: json["name"],
        children:
            List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
        column: json["column"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "name": name,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
        "column": column,
        "href": href,
      };
}

class Child {
  String categoryId;
  String name;
  String href;

  Child({
    required this.categoryId,
    required this.name,
    required this.href,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        categoryId: json["category_id"],
        name: json["name"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "name": name,
        "href": href,
      };
}
