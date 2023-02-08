class ShortProfileResponse {
  ShortProfileResponse({
    required this.status,
    required this.message,
    required this.shortprofile,
  });
  bool status;
  String message;
  ShortProfile shortprofile;

}

class ShortProfile {
  ShortProfile({
    required this.name,
    required this.email,
    required this.mobile,
    required this.profileImage,
  });

  String name;
  String email;
  String mobile;
  String profileImage;
}