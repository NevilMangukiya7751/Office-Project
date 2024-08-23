// To parse this JSON data, do
//
//     final cartDetailsResponse = cartDetailsResponseFromJson(jsonString);

import 'dart:convert';

CartDetailsResponse cartDetailsResponseFromJson(String str) =>
    CartDetailsResponse.fromJson(json.decode(str));

String cartDetailsResponseToJson(CartDetailsResponse data) =>
    json.encode(data.toJson());

class CartDetailsResponse {
  List<Product> products;
  List<dynamic> vouchers;
  List<Total> totals;
  bool shippingRequired;

  CartDetailsResponse({
    required this.products,
    required this.vouchers,
    required this.totals,
    required this.shippingRequired,
  });

  factory CartDetailsResponse.fromJson(Map<String, dynamic> json) =>
      CartDetailsResponse(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        vouchers: List<dynamic>.from(json["vouchers"].map((x) => x)),
        totals: List<Total>.from(json["totals"].map((x) => Total.fromJson(x))),
        shippingRequired: json["shipping_required"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "vouchers": List<dynamic>.from(vouchers.map((x) => x)),
        "totals": List<dynamic>.from(totals.map((x) => x.toJson())),
        "shipping_required": shippingRequired,
      };
}

class Product {
  String cartId;
  String productId;
  String name;
  String model;
  List<dynamic> option;
  String subscription;
  String quantity;
  bool stock;
  bool minimum;
  int reward;
  String price;
  String total;

  Product({
    required this.cartId,
    required this.productId,
    required this.name,
    required this.model,
    required this.option,
    required this.subscription,
    required this.quantity,
    required this.stock,
    required this.minimum,
    required this.reward,
    required this.price,
    required this.total,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        cartId: json["cart_id"],
        productId: json["product_id"],
        name: json["name"],
        model: json["model"],
        option: List<dynamic>.from(json["option"].map((x) => x)),
        subscription: json["subscription"],
        quantity: json["quantity"],
        stock: json["stock"],
        minimum: json["minimum"],
        reward: json["reward"],
        price: json["price"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "product_id": productId,
        "name": name,
        "model": model,
        "option": List<dynamic>.from(option.map((x) => x)),
        "subscription": subscription,
        "quantity": quantity,
        "stock": stock,
        "minimum": minimum,
        "reward": reward,
        "price": price,
        "total": total,
      };
}

class Total {
  String title;
  String text;

  Total({
    required this.title,
    required this.text,
  });

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        title: json["title"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "text": text,
      };
}
