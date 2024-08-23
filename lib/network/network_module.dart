// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'package:dio/dio.dart';

import '../persistance/shared_preference_helper.dart';
import 'endpoint.dart';

abstract class NetworkModule {
  static Dio provideDio(SharedPreferenceHelper sharedPrefHelper) {
    final dio = Dio();

    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout =
          Duration(milliseconds: Endpoints.connectionTimeout)
      ..options.receiveTimeout =
          Duration(milliseconds: Endpoints.receiveTimeout)
      ..options.headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json'
      }
      //..interceptors.add(LoggingInterceptor())
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options,
              RequestInterceptorHandler handler) async {
            // getting token
            var token = await sharedPrefHelper.authToken;
            if (token != null && token.isNotEmpty) {
              options.headers
                  .putIfAbsent('Authorization', () => "Bearer $token");
              print("auth Token>>$token");
            } else {
              log('Auth token is null');
            }
            return handler.next(options);
          },
        ),
      );

    return dio;
  }
}
