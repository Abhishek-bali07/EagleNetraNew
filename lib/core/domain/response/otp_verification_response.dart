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

import 'kid_short_info_response.dart';

OtpVerificationResponse otpVerificationResponseFromJson(String str) => OtpVerificationResponse.fromJson(json.decode(str));

String otpVerificationResponseToJson(OtpVerificationResponse data) => json.encode(data.toJson());

class OtpVerificationResponse extends BusinessObject {
  OtpVerificationResponse({
    required this.status,
    required this.userStatus,
    required this.message,
    required this.userId,
    required this.isVerified,
     required this.details
  });

  final bool status;
  final String userStatus;
  final String message;
  final String userId;
  final bool isVerified;
  List<ShortDetails> details;

  factory OtpVerificationResponse.fromJson(Map<String, dynamic> json) => OtpVerificationResponse(
    status: json["status"],
    userStatus: json["userStatus"],
    message: json["message"],
    userId: json["userId"],
    isVerified: json["isVerified"],
    details: List<ShortDetails>.from(json["shortDetails"].map((x) => ShortDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "userStatus": userStatus,
    "message": message,
    "userId": userId,
    "isVerified": isVerified,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}
