// To parse this JSON data, do
//
//     final baseUrlResponse = baseUrlResponseFromJson(jsonString);

class BaseUrlResponse {
  BaseUrlResponse({
    required this.status,
    required this.message,
    required this.baseUrl,
    required this.version,
  });

  final bool status;
  final String message;
  final String baseUrl;
  final String version;


}

class Version {
  Version({
    required this.name,
    required this.code,
    required this.date,
    required this.isSkipable,
  });

  final String name;
  final int code;
  final String date;
  final bool isSkipable;


}
