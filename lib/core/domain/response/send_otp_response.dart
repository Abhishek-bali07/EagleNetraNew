
import 'dart:convert';

import 'business_object.dart';

SendOtpResponse sendOtpResponseFromJson(String str) => SendOtpResponse.fromJson(json.decode(str));

String sendOtpResponseToJson(SendOtpResponse data) => json.encode(data.toJson());

class SendOtpResponse extends BusinessObject{
  SendOtpResponse({
    required this.status,
    required this.message,
    required this.otp,
    required this.isSend,
  });

  final bool status;
  final String message;
  final String otp;
  final bool isSend;

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) => SendOtpResponse(
    status: json["status"],
    message: json["message"],
    otp: json["otp"],
    isSend: json["isSend"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "otp": otp,
    "isSend": isSend,
  };
}



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