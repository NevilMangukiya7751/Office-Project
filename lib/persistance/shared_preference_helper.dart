import 'dart:convert';
import 'dart:developer';

import 'package:macos2/persistance/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/strings.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // Save Device Token: ----------------------------------------------------------
  String get deviceToken {
    final deviceToken =
        _sharedPreference.getString(Preferences.deviceToken) ?? "";
    return deviceToken.isEmpty ? "no_token" : deviceToken;
  }

  Future<bool> saveDeviceToken(String deviceToken) async {
    return _sharedPreference.setString(Preferences.deviceToken, deviceToken);
  }

  // General Methods: ----------------------------------------------------------
  Future<String?> get authToken async {
    return _sharedPreference.getString(Preferences.authToken);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreference.setString(Preferences.authToken, authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(Preferences.authToken);
  }

  // Login:---------------------------------------------------------------------
  bool get isLoggedIn {
    return _sharedPreference.getBool(Preferences.isLoggedIn) ?? false;
  }

  Future<bool> saveIsLoggedIn(bool value) async {
    return _sharedPreference.setBool(Preferences.isLoggedIn, value);
  }

  bool get logInFirstTime {
    return _sharedPreference.getBool(Preferences.logInFirstTime) ?? false;
  }

  Future<bool> saveLogInFirstTime(bool value) async {
    return _sharedPreference.setBool(Preferences.logInFirstTime, value);
  }

  // LOGINS RESPONSE SAVE

  String get getUserId {
    return _sharedPreference.getString(Preferences.userId) ?? "";
  }

  Future<bool> setUserId(String value) async {
    return _sharedPreference.setString(Preferences.userId, value);
  }

  bool get getTokenCollected {
    return _sharedPreference.getBool(Preferences.tokenCollect) ?? false;
  }

  Future<bool> setTokenCollect(bool value) async {
    return _sharedPreference.setBool(Preferences.tokenCollect, value);
  }

// USer Side:---------------------------------------------------------------------

  bool get getCLogin {
    return _sharedPreference.getBool(Preferences.cLogin) ?? false;
  }

  Future<bool> setCLogin(bool value) async {
    return _sharedPreference.setBool(Preferences.cLogin, value);
  }
}
