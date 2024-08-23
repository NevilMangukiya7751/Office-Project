// To parse this JSON data, do
//
//     final storeDetailResponse = storeDetailResponseFromJson(jsonString);

import 'dart:convert';

StoreDetailResponse storeDetailResponseFromJson(String str) =>
    StoreDetailResponse.fromJson(json.decode(str));

String storeDetailResponseToJson(StoreDetailResponse data) =>
    json.encode(data.toJson());

class StoreDetailResponse {
  bool success;
  List<Currency> currencies;
  List<Language> languages;

  StoreDetailResponse({
    required this.success,
    required this.currencies,
    required this.languages,
  });

  factory StoreDetailResponse.fromJson(Map<String, dynamic> json) =>
      StoreDetailResponse(
        success: json["success"],
        currencies: List<Currency>.from(
            json["currencies"].map((x) => Currency.fromJson(x))),
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
      };
}

class Currency {
  String currencyId;
  String title;
  String code;
  String symbolLeft;
  String symbolRight;

  Currency({
    required this.currencyId,
    required this.title,
    required this.code,
    required this.symbolLeft,
    required this.symbolRight,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        currencyId: json["currency_id"],
        title: json["title"],
        code: json["code"],
        symbolLeft: json["symbol_left"],
        symbolRight: json["symbol_right"],
      );

  Map<String, dynamic> toJson() => {
        "currency_id": currencyId,
        "title": title,
        "code": code,
        "symbol_left": symbolLeft,
        "symbol_right": symbolRight,
      };
}

class Language {
  String languageId;
  String name;
  String code;
  String image;

  Language({
    required this.languageId,
    required this.name,
    required this.code,
    required this.image,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        languageId: json["language_id"],
        name: json["name"],
        code: json["code"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "language_id": languageId,
        "name": name,
        "code": code,
        "image": image,
      };
}
