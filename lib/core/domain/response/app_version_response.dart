import '../app_version_response.dart';

class AppVersionResponse {
  AppVersionResponse(
      {required this.status,
        required this.message,
        required this.version});

  bool status;
  String message;
  AppVersion version;

}
