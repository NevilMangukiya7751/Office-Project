// To parse this JSON data, do
//
//     final cRegisterResponse = cRegisterResponseFromJson(jsonString);

import 'dart:convert';

CRegisterResponse cRegisterResponseFromJson(String str) =>
    CRegisterResponse.fromJson(json.decode(str));

String cRegisterResponseToJson(CRegisterResponse data) =>
    json.encode(data.toJson());

class CRegisterResponse {
  bool success;
  Data data;

  CRegisterResponse({
    required this.success,
    required this.data,
  });

  factory CRegisterResponse.fromJson(Map<String, dynamic> json) =>
      CRegisterResponse(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  String apiId;
  String currency;
  Customer customer;
  String customerToken;
  String customerId;

  Data({
    required this.apiId,
    required this.currency,
    required this.customer,
    required this.customerToken,
    required this.customerId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        apiId: json["api_id"],
        currency: json["currency"],
        customer: Customer.fromJson(json["customer"]),
        customerToken: json["customer_token"],
        customerId: json["customer_id"],
      );

  Map<String, dynamic> toJson() => {
        "api_id": apiId,
        "currency": currency,
        "customer": customer.toJson(),
        "customer_token": customerToken,
        "customer_id": customerId,
      };
}

class Customer {
  int customerId;
  int customerGroupId;
  String firstname;
  String lastname;
  String email;
  String telephone;
  String customField;

  Customer({
    required this.customerId,
    required this.customerGroupId,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.telephone,
    required this.customField,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerId: json["customer_id"],
        customerGroupId: json["customer_group_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        telephone: json["telephone"],
        customField: json["custom_field"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "customer_group_id": customerGroupId,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "telephone": telephone,
        "custom_field": customField,
      };
}
