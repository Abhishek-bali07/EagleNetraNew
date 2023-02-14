

import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

RegisterUserResponse registerUserResponseFromJson(String str) => RegisterUserResponse.fromJson(json.decode(str));

String registerUserResponseToJson(RegisterUserResponse data) => json.encode(data.toJson());

class RegisterUserResponse  extends BusinessObject{
  RegisterUserResponse({
    required this.status,
    required this.message,
    required this.inserted,
  });

  final bool status;
  final String message;
  final bool inserted;

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) => RegisterUserResponse(
    status: json["status"],
    message: json["message"],
    inserted: json["inserted"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "inserted": inserted,
  };
}


//
//
// class RegisterUserResponse {
//   RegisterUserResponse({
//     required this.status,
//     required this.message,
//     required this.userId,
//     required this.userStatus,
//     required this.isVerified
//   });
//
//
//   bool status;
//   String message;
//   bool isVerified;
//   String userId;
//   String userStatus;
//
//
// }