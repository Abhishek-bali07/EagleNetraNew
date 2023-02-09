// class OtpVerificationResponse {
//   OtpVerificationResponse(
//       {required this.status,
//         required this.message,
//         required this.isVerified,
//         required this.userId,
//         required this.userStatus});
//
//   bool status;
//   String message;
//   bool isVerified;
//   String userId;
//   String userStatus;
// }



import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

OtpVerificationResponse otpVerificationResponseFromJson(String str) => OtpVerificationResponse.fromJson(json.decode(str));

String otpVerificationResponseToJson(OtpVerificationResponse data) => json.encode(data.toJson());

class OtpVerificationResponse extends BusinessObject{
  OtpVerificationResponse({
    required this.status,
    required this.message,
    required this.userId,
    required this.isVerified,
    required this.userStatus,
  });

  final bool status;
  final String message;
  final bool isVerified;
  final String userId;
  final String userStatus;

  factory OtpVerificationResponse.fromJson(Map<String, dynamic> json) => OtpVerificationResponse(
    status: json["status"],
    message: json["message"],
    userId: json["userId"],
    isVerified: json["isVerified"],
    userStatus: json["userStatus"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "userId": userId,
    "isVerified": isVerified,
    "userStatus": userStatus,

  };
}
