import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/LoginResponse.dart';

import '../network/ApiRepository.dart';
import '../requestData/Inovice.dart';

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

  InoviceRequest? _inoviceRequest;
  InoviceRequest? get inoviceRequest {
    return _inoviceRequest;
  }

  set setInoviceRequest(InoviceRequest request) {
    _inoviceRequest = request;
  }

  // Register
  // Future<void> login(ValueSetter<bool> onResponse) async {
  //   log("Account_vm login.....");
  //   try {
  //     final response = await _repository.login(loginRequest!);
  //     _loginResponse = response;
  //     onResponse(true);
  //   } catch (e) {
  //     log("Account_vm login catch>>>   $e");
  //     _loginResponse = null;
  //
  //     log("loginressss $_loginResponse");
  //     errorMessage = e.toString();
  //     onResponse(false);
  //   }
  //   notifyListeners();
  // }
}
