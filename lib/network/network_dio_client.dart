import 'dart:developer';
import 'package:dio/dio.dart';

import '../constant/remoteData/Dio/app_exception.dart';
import '../constant/strings.dart';

class NetworkClientDio {
  // dio instance
  final Dio _dio;

  // injecting dio instance
  NetworkClientDio(this._dio);

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      print("GET ERROR?????${e.toString()}");
      if (e is DioException) {
        throw AppException(e);
      } else {
        throw AppException(Strings.unknownError);
      }
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    print('Request URL: $uri');
    print('Request data: $data');
    print('Request queryPerameter: $queryParameters');
    print('Request options: $options');
    print('Request canceltoken: $cancelToken');
    print('Request on send: $onSendProgress');
    log("POST onreceive>>.$onReceiveProgress");
    try {
      Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      print('Response Status Code: ${response.data}');
      if (response.statusCode == 401) {
        log("post status code>>>${response.statusCode}");
      } else {
        return response.data;
      }
      // Log the full response details

      print('Response Status Code: ${response.statusCode}');
      print('Response URL: ${response.requestOptions.uri}');
      print('RequResponseest Headers: ${response.requestOptions.headers}');
      print('Response Body: $data');

      print('Response Headers: ${response.headers}');
      print('Response Data: ${response.data}');
      log("POST RESPONSE>>.${response.toString()}");
    } catch (e) {
      if (e is DioError) {
        print("POST Dio ERROR?????${e.response}");
        throw AppException(e);
      } else {
        throw AppException(Strings.unknownError);
      }
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      if (e is DioError) {
        throw AppException(e);
      } else {
        throw AppException(Strings.unknownError);
      }
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      if (e is DioError) {
        throw AppException(e);
      } else {
        throw AppException(Strings.unknownError);
      }
    }
  }
}
