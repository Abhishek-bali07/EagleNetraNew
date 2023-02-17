import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

KidShortInfoResponse kidShortInfoResponseFromJson(String str) => KidShortInfoResponse.fromJson(json.decode(str));

String kidShortInfoResponseToJson(KidShortInfoResponse data) => json.encode(data.toJson());

class KidShortInfoResponse  extends BusinessObject{
  KidShortInfoResponse({
    required this.status,
    required this.message,
    required this.shortDetails,
  });

  final bool status;
  final String message;
  final List<ShortDetails> shortDetails;

  factory KidShortInfoResponse.fromJson(Map<String, dynamic> json) => KidShortInfoResponse(
    status: json["status"],
    message: json["message"],
    shortDetails: List<ShortDetails>.from(json["shortDetails"].map((x) => ShortDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "shortDetails": List<dynamic>.from(shortDetails.map((x) => x.toJson())),
  };
}

class ShortDetails {
  ShortDetails({
    required this.smartCardId,
    required this.name,
    required this.age,
    required this.clsName,
    required this.image,
    required this.activateFrom,
    required this.deviceId,
  });

  final String smartCardId;
  final String name;
  final String age;
  final String clsName;
  final String? image;
  final String activateFrom;
  final String deviceId;

  factory ShortDetails.fromJson(Map<String, dynamic> json) => ShortDetails(
    smartCardId: json["smartCardId"],
    name: json["name"],
    age: json["age"],
    clsName: json["clsName"],
    image: json["image"],
    activateFrom: json["activateFrom"],
    deviceId: json["device_id"],
  );

  Map<String, dynamic> toJson() => {
    "smartCardId": smartCardId,
    "name": name,
    "age": age,
    "clsName": clsName,
    "image": image,
    "activateFrom": activateFrom,
    "device_id": deviceId,
  };
}








// class KidShortInfoResponse  {
//   KidShortInfoResponse({
//     required this.status,
//     required this.message,
//     required this.shortDetails,
//   });
//
//   final bool status;
//   final String message;
//   final List<ShortDetails> shortDetails;
// }
//
// class ShortDetails {
//   ShortDetails({
//     required this.kidId,
//     required this.name,
//     required this.image,
//     required this.age,
//     required this.clsname,
//     required this.activateFrom,
//     required this.expiredOn,
//     required this.deviceId,
//   });
//   final String kidId;
//   final String name;
//   final String image;
//   final String age;
//   final String clsname;
//   final String activateFrom;
//   final String expiredOn;
//   final String deviceId;
//
// }
