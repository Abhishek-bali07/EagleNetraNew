// class SendOtpResponse  {
//   SendOtpResponse(
//       {required this.status,
//         required this.message,
//         required this.isSend,
//         required this.otp,
//       });
//
//   bool status;
//   String message;
//   bool isSend;
//   String otp;
// }
import 'dart:convert';

import 'business_object.dart';

SendOtpResponse sendOtpResponseFromJson(String str) => SendOtpResponse.fromJson(json.decode(str));

String sendOtpResponseToJson(SendOtpResponse data) => json.encode(data.toJson());

class SendOtpResponse extends BusinessObject{
  SendOtpResponse({
    required this.status,
    required this.message,
    required this.isSend,
    required this.otp,
  });

  final bool status;
  final String message;
  bool isSend;
  final String otp;

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) => SendOtpResponse(
    status: json["status"],
    message: json["message"],
    isSend: json["isSend"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "isSend" : isSend,
    "otp": otp,
  };
}
