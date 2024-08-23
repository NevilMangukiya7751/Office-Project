// To parse this JSON data, do
//
//     final productDetailsResponse = productDetailsResponseFromJson(jsonString);

import 'dart:convert';

ProductDetailsResponse productDetailsResponseFromJson(String str) =>
    ProductDetailsResponse.fromJson(json.decode(str));

String productDetailsResponseToJson(ProductDetailsResponse data) =>
    json.encode(data.toJson());

class ProductDetailsResponse {
  dynamic success;
  Data data;

  ProductDetailsResponse({
    required this.success,
    required this.data,
  });

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      ProductDetailsResponse(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  String productId;
  String storeId;
  String masterId;
  String model;
  String sku;
  String upc;
  String ean;
  String jan;
  String isbn;
  String mpn;
  String location;
  List<dynamic> variant;
  List<dynamic> override;
  String quantity;
  String stockStatusId;
  String image;
  String manufacturerId;
  String shipping;
  String price;
  String points;
  String taxClassId;
  DateTime dateAvailable;
  String weight;
  String weightClassId;
  String length;
  String width;
  String height;
  String lengthClassId;
  String subtract;
  String minimum;
  int rating;
  String sortOrder;
  String status;
  DateTime dateAdded;
  DateTime dateModified;
  String languageId;
  String name;
  String description;
  String tag;
  String metaTitle;
  String metaDescription;
  String metaKeyword;
  dynamic discount;
  dynamic special;
  dynamic reward;
  String reviews;
  String popup;
  String thumb;
  List<Image> images;
  String tax;
  List<Discount> discounts;

  Data({
    required this.productId,
    required this.storeId,
    required this.masterId,
    required this.model,
    required this.sku,
    required this.upc,
    required this.ean,
    required this.jan,
    required this.isbn,
    required this.mpn,
    required this.location,
    required this.variant,
    required this.override,
    required this.quantity,
    required this.stockStatusId,
    required this.image,
    required this.manufacturerId,
    required this.shipping,
    required this.price,
    required this.points,
    required this.taxClassId,
    required this.dateAvailable,
    required this.weight,
    required this.weightClassId,
    required this.length,
    required this.width,
    required this.height,
    required this.lengthClassId,
    required this.subtract,
    required this.minimum,
    required this.rating,
    required this.sortOrder,
    required this.status,
    required this.dateAdded,
    required this.dateModified,
    required this.languageId,
    required this.name,
    required this.description,
    required this.tag,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeyword,
    required this.discount,
    required this.special,
    required this.reward,
    required this.reviews,
    required this.popup,
    required this.thumb,
    required this.images,
    required this.tax,
    required this.discounts,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var imagesList = json["images"] ?? [];
    return Data(
      productId: json["product_id"],
      storeId: json["store_id"],
      masterId: json["master_id"],
      model: json["model"],
      sku: json["sku"],
      upc: json["upc"],
      ean: json["ean"],
      jan: json["jan"],
      isbn: json["isbn"],
      mpn: json["mpn"],
      location: json["location"],
      variant: List<dynamic>.from(json["variant"].map((x) => x)),
      override: List<dynamic>.from(json["override"].map((x) => x)),
      quantity: json["quantity"],
      stockStatusId: json["stock_status_id"],
      image: json["image"],
      manufacturerId: json["manufacturer_id"],
      shipping: json["shipping"],
      price: json["price"],
      points: json["points"],
      taxClassId: json["tax_class_id"],
      dateAvailable: DateTime.parse(json["date_available"]),
      weight: json["weight"],
      weightClassId: json["weight_class_id"],
      length: json["length"],
      width: json["width"],
      height: json["height"],
      lengthClassId: json["length_class_id"],
      subtract: json["subtract"],
      minimum: json["minimum"],
      rating: json["rating"],
      sortOrder: json["sort_order"],
      status: json["status"],
      dateAdded: DateTime.parse(json["date_added"]),
      dateModified: DateTime.parse(json["date_modified"]),
      languageId: json["language_id"],
      name: json["name"],
      description: json["description"],
      tag: json["tag"],
      metaTitle: json["meta_title"],
      metaDescription: json["meta_description"],
      metaKeyword: json["meta_keyword"],
      discount: json["discount"],
      special: json["special"],
      reward: json["reward"],
      reviews: json["reviews"],
      popup: json["popup"],
      thumb: json["thumb"],
      images: imagesList.isNotEmpty
          ? List<Image>.from(imagesList.map((x) => Image.fromJson(x)))
          : [],
      tax: json["tax"],
      discounts: List<Discount>.from(
          json["discounts"].map((x) => Discount.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "store_id": storeId,
        "master_id": masterId,
        "model": model,
        "sku": sku,
        "upc": upc,
        "ean": ean,
        "jan": jan,
        "isbn": isbn,
        "mpn": mpn,
        "location": location,
        "variant": List<dynamic>.from(variant.map((x) => x)),
        "override": List<dynamic>.from(override.map((x) => x)),
        "quantity": quantity,
        "stock_status_id": stockStatusId,
        "image": image,
        "manufacturer_id": manufacturerId,
        "shipping": shipping,
        "price": price,
        "points": points,
        "tax_class_id": taxClassId,
        "date_available":
            "${dateAvailable.year.toString().padLeft(4, '0')}-${dateAvailable.month.toString().padLeft(2, '0')}-${dateAvailable.day.toString().padLeft(2, '0')}",
        "weight": weight,
        "weight_class_id": weightClassId,
        "length": length,
        "width": width,
        "height": height,
        "length_class_id": lengthClassId,
        "subtract": subtract,
        "minimum": minimum,
        "rating": rating,
        "sort_order": sortOrder,
        "status": status,
        "date_added": dateAdded.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "language_id": languageId,
        "name": name,
        "description": description,
        "tag": tag,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keyword": metaKeyword,
        "discount": discount,
        "special": special,
        "reward": reward,
        "reviews": reviews,
        "popup": popup,
        "thumb": thumb,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "tax": tax,
        "discounts": List<dynamic>.from(discounts.map((x) => x.toJson())),
      };
}

class Discount {
  String quantity;
  String price;

  Discount({
    required this.quantity,
    required this.price,
  });

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        quantity: json["quantity"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "price": price,
      };
}

class Image {
  String popup;
  String thumb;

  Image({
    required this.popup,
    required this.thumb,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        popup: json["popup"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "popup": popup,
        "thumb": thumb,
      };
}
