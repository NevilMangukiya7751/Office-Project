// To parse this JSON data, do
//
//     final categoryDetailResponse = categoryDetailResponseFromJson(jsonString);

import 'dart:convert';

CategoryDetailResponse categoryDetailResponseFromJson(String str) =>
    CategoryDetailResponse.fromJson(json.decode(str));

String categoryDetailResponseToJson(CategoryDetailResponse data) =>
    json.encode(data.toJson());

class CategoryDetailResponse {
  bool success;
  Options options;
  List<Product> products;

  CategoryDetailResponse({
    required this.success,
    required this.options,
    required this.products,
  });

  factory CategoryDetailResponse.fromJson(Map<String, dynamic> json) =>
      CategoryDetailResponse(
        success: json["success"],
        options: Options.fromJson(json["options"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "options": options.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Options {
  int total;
  int page;
  int limit;

  Options({
    required this.total,
    required this.page,
    required this.limit,
  });

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        total: json["total"],
        page: json["page"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "limit": limit,
      };
}

class Product {
  String productId;
  String thumb;
  String name;
  String description;
  String price;
  dynamic special;
  String tax;
  String minimum;
  String rating;
  String href;

  Product({
    required this.productId,
    required this.thumb,
    required this.name,
    required this.description,
    required this.price,
    required this.special,
    required this.tax,
    required this.minimum,
    required this.rating,
    required this.href,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        thumb: json["thumb"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        special: json["special"],
        tax: json["tax"],
        minimum: json["minimum"],
        rating: json["rating"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "thumb": thumb,
        "name": name,
        "description": description,
        "price": price,
        "special": special,
        "tax": tax,
        "minimum": minimum,
        "rating": rating,
        "href": href,
      };
}
