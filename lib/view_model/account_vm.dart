import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/AuthenticationModels/CRegisterResponse.dart';
import '../models/Carts/AddToCartRequest.dart';
import '../models/CategoyResponses/CategoryResponse.dart';
import '../models/LoginResponse.dart';

import '../models/StoreDetailResponse.dart';
import '../network/ApiRepository.dart';

import '../requestData/SetCurrencyRequest.dart';
import '../requestData/loginReguest.dart';

class AccountViewModel with ChangeNotifier {
  final Repository _repository;
  String? errorMessage;

  AccountViewModel(this._repository);

  ///*************Response***********
  //Register
  LoginResponse? _loginResponse;
  LoginResponse? get loginResponse {
    return _loginResponse;
  }

  ///**
  ///**************** Request****************
  //Register

  LoginRequest? _loginRequest;
  LoginRequest? get loginRequest {
    return _loginRequest;
  }

  // set setLoginRequest(LoginRequest request) {
  //   _loginRequest = request;
  // }

  // Register
  Future<void> login(ValueSetter<bool> onResponse) async {
    log("Account_vm login.....");
    try {
      final response = await _repository.login(loginRequest!);
      _loginResponse = response;
      onResponse(true);
    } catch (e) {
      log("Account_vm login catch>>>   $e");
      _loginResponse = null;

      log("loginressss $_loginResponse");
      errorMessage = e.toString();
      onResponse(false);
    }
    notifyListeners();
  }
}
