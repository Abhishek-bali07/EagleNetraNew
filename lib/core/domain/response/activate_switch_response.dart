import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

ActivateSwitchResponse activateSwitchResponseFromJson(String str) => ActivateSwitchResponse.fromJson(json.decode(str));

String activateSwitchResponseToJson(ActivateSwitchResponse data) => json.encode(data.toJson());

class ActivateSwitchResponse extends BusinessObject{
  ActivateSwitchResponse({
    required this.status,
    required this.message,
    required this.isActivated,
  });

  final bool status;
  final String message;
  final bool isActivated;

  factory ActivateSwitchResponse.fromJson(Map<String, dynamic> json) => ActivateSwitchResponse(
    status: json["status"],
    message: json["message"],
    isActivated: json["isActivated"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "isActivated": isActivated,
  };
}



// class ActivateSwitchResponse{
//   ActivateSwitchResponse({
//     required this.status,
//     required this.message,
//     required this.isActivated,
// });
//   final bool status;
//   final String message;
//   final bool isActivated;
//
// }