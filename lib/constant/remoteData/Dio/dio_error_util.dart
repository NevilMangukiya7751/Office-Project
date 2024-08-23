/*
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:tap_social/constant/strings.dart';
import 'package:tap_social/response/message_response.dart';


class DioErrorUtil {
  // general methods:------------------------------------------------------------
  static String handleError(DioException error, {bool isLogin = false}) {
    String errorDescription = "";
    if (error is DioException) {
      // print("error type>>.${error.type}");
      switch (error.type) {
        case DioExceptionType.cancel:
          errorDescription = Strings.timeoutError;
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = Strings.timeoutError;
          break;
        case DioExceptionType.unknown:
          errorDescription = Strings.connectionError;
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = Strings.timeoutError;
          break;
        case DioExceptionType.response:
          print("error response////${error.response}");
          if(error.response.toString().contains('result')){
            var errorResponse = MessageResponse.fromJson(jsonDecode(error.response.toString()));
            if (errorResponse.message != null && errorResponse.message != "") {
              errorDescription = errorResponse.message;
              print("error description///$errorDescription");
            } else {
              print("error///$errorDescription");
              errorDescription = _handleError(
                  error.response!.statusCode!, error.response!.data!);
            }

          }else{
            var jsonData = jsonDecode(error.response.toString());
            if(jsonData['message'].toString() == 'Unauthenticated.'){
              errorDescription = jsonData['message'].toString();
            }
          }

          break;
        case DioExceptionType.sendTimeout:
          errorDescription = Strings.timeoutError;
          break;
      }
    } else {
      print("dio error else>>");
      errorDescription = Strings.unexpectedError;
    }
    return errorDescription;
  }

  static String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return Strings.badRequestError;
      case 404:
        return error["message"];
      case 500:
        return Strings.serverError;
      default:
        return Strings.unknownError;
    }
  }
}
*/
