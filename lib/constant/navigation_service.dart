import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamedToAndRemoveUntil(String routeName) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  Future<dynamic> pushAndRemoveUntil(Widget widget) {
    // return navigatorKey.currentState!
    //     .pushNamedAndRemoveUntil(routeName, (route) => false);
    return navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false);
  }

  Future<dynamic> pushNamed(String routeName, Object arguments) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }
}
