class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 500);
  static const Duration receiveTimeout = Duration(seconds: 1000);

  // static const String baseUrl = "http://10.0.2.2:5000/api/";
  //
  static const String baseUrl = "https://rpp.sarbatra.com/api/";

  static const String login = "auth/login";
}
