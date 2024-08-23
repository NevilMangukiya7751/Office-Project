import 'package:flutter/material.dart';

List<DashboardList> dashboardList = [
  DashboardList(title: "Total Sale", amt: "5842"),
  DashboardList(title: "Total Payment", amt: "5842"),
  DashboardList(title: "Total Discount", amt: "5842"),
  DashboardList(title: "Total Order", amt: "5842"),
  DashboardList(title: "Total Customer", amt: "5842"),
  DashboardList(title: "Total Categories", amt: "5842"),
  DashboardList(title: "Total Product", amt: "5842"),
  DashboardList(title: "Total Stock", amt: "5842"),
  DashboardList(title: "Total Stock Value", amt: "5842"),
];

List current = [
  "Today",
  "This Week",
  "Month",
  "Year",
];

class DashboardList {
  final String title;
  final String amt;

  DashboardList({
    required this.title,
    required this.amt,
  });

  // Factory constructor to create a DashboardList from a JSON object
  factory DashboardList.fromJson(Map<String, dynamic> json) {
    return DashboardList(
      title: json['title'],
      amt: json['amt'],
    );
  }

  // Method to convert a DashboardList to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'amt': amt,
    };
  }
}
