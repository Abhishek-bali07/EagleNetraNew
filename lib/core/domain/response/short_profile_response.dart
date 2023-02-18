import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

ShortProfileResponse shortProfileResponseFromJson(String str) => ShortProfileResponse.fromJson(json.decode(str));

String shortProfileResponseToJson(ShortProfileResponse data) => json.encode(data.toJson());

class ShortProfileResponse extends BusinessObject{
  ShortProfileResponse({
    required this.status,
    required this.message,
    required this.shortprofile,
  });

  final bool status;
  final String message;
  final ShortProfile shortprofile;

  factory ShortProfileResponse.fromJson(Map<String, dynamic> json) => ShortProfileResponse(
    status: json["status"],
    message: json["message"],
    shortprofile: ShortProfile.fromJson(json["shortprofile"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "shortprofile": shortprofile.toJson(),
  };
}

class ShortProfile {
  ShortProfile({
    required this.name,
    required this.email,
    required this.profileImage,
    required this.mobile,
  });

  final String name;
  final String email;
  final String profileImage;
  final String mobile;

  factory ShortProfile.fromJson(Map<String, dynamic> json) => ShortProfile(
    name: json["name"],
    email: json["email"],
    profileImage: json["profileImage"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "profileImage": profileImage,
    "mobile": mobile,
  };
}





// class ShortProfileResponse {
//   ShortProfileResponse({
//     required this.status,
//     required this.message,
//     required this.shortprofile,
//   });
//   bool status;
//   String message;
//   ShortProfile shortprofile;
//
// }
//
// class ShortProfile {
//   ShortProfile({
//     required this.name,
//     required this.email,
//     required this.mobile,
//     required this.profileImage,
//   });
//
//   String name;
//   String email;
//   String mobile;
//   String profileImage;
// }