import 'package:get/get_connect/connect.dart';

class RestClient extends GetConnect {
  String backendBaseURL = "https://api.coingecko.com/api/v3";

  RestClient() {
    httpClient.baseUrl = backendBaseURL;
    httpClient.errorSafety = false;
    timeout = const Duration(seconds: 20);
  }
}
