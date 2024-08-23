import '../constant/service_locator.dart';
import '../persistance/shared_preference_helper.dart';

class Endpoints {
  Endpoints._();

  static const String baseUrl =
      "http://192.168.0.101/themes/bharat/opencart/wigs/index.php?route=tatapi/";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  static const String token = "${baseUrl}account/login";
  static String homepage =
      "${baseUrl}common/home&api_token=${getIt<SharedPreferenceHelper>().getUserId}";
}
