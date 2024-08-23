import 'dart:developer';

class AppException implements Exception {
  final _message;

  AppException([this._message]);

  String toString() {
    log("EXCEPTION MESSAGEW>>>$_message");
    return "$_message";
  }
}
