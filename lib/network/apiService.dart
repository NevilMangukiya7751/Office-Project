// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../constant/remoteData/Dio/app_exception.dart';

import '../constant/strings.dart';

import '../models/LoginResponse.dart';

import '../requestData/loginReguest.dart';

import 'endpoint.dart';
import 'package:http/http.dart' as http;
import 'network_dio_client.dart';

Logger logger = Logger();

class ApiService {
  // dio instance
  final NetworkClientDio _dioClient;

  // injecting dio instance
  ApiService(this._dioClient);

  //Register

  Future<LoginResponse> login(LoginRequest request) async {
    log("login in api >>>");

    try {
      final data = request.toJson();

      String url = Endpoints.token;
      logger.i("login Api $url");

      log("resss data $data");

      final res = await http.post(
        Uri.parse(url),
        body: {
          'username': "TATAPI",
          'key':
              "h1lceNIBXeU21pWroE2Ge1NGZVwaI6bE2Co1s5xL21x0cxJNFa3T5fR2a2dz2wRouA26jDFXPVEdGw4GxJc4svRx8o0VkTgfknu5QNKIO4Kkl87QyCtrzckIDf2dvqQBhKbzd0uru1SUatclzB8yNvpE60STohFYUD6VY5vtYf1L50fgtFdigZWrtGZ5QhYvlCRlTFFbTZhp6eGSIUczq7I1gqWkzsozbCOzjEuL1cCUHInublBJGkMyJledruzA",
        },
      );

      Map<String, dynamic> response = jsonDecode(res.body);
      if (res is Map<String, dynamic>) {
        logger.i("login Final Url $res");
        return LoginResponse.fromJson(response);
      }

      return LoginResponse.fromJson(response);
    } catch (e) {
      log("login Response Error $e");
      debugPrint(e.toString());
      throw e is AppException ? e : AppException(Strings.unexpectedResponse);
    }
  }
}
