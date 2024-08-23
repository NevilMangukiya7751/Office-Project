import 'dart:developer';
import '../models/LoginResponse.dart';
import '../persistance/shared_preference_helper.dart';
import '../requestData/loginReguest.dart';
import 'apiService.dart';

class Repository {
  // api objects
  final ApiService _api;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(this._api, this._sharedPrefsHelper);

  Future<LoginResponse> login(LoginRequest request) async {
    log("login in repository>>>");
    try {
      final response = await _api.login(request);

      log("Reeee ${response.apiToken}");
      _sharedPrefsHelper.setUserId(response.apiToken);

      _sharedPrefsHelper.saveLogInFirstTime(true);

      // _sharedPrefsHelper.setUserId(response.userid.toString());
      //
      // // _sharedPrefsHelper.setProfileImage(response.profilePic);
      // _sharedPrefsHelper.setUserName(response.username);
      _sharedPrefsHelper.saveIsLoggedIn(true);
      // _sharedPrefsHelper.setEmailId(response.email);
      // _sharedPrefsHelper.setMessage(response.message);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
