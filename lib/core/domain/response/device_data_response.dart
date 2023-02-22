import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

KidDeviceResponse kidDeviceResponseFromJson(String str) => KidDeviceResponse.fromJson(json.decode(str));

String kidDeviceResponseToJson(KidDeviceResponse data) => json.encode(data.toJson());

class KidDeviceResponse extends BusinessObject{
  KidDeviceResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final Data data;

  factory KidDeviceResponse.fromJson(Map<String, dynamic> json) => KidDeviceResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.name,
    required this.image,
    required this.phone,
    required this.devicedate,
    required this.devicetime,
    required this.devicelocation,
    required this.batteryperformance,
    required this.condition,
  });

  final String name;
  final String image;
  final String phone;
  final String devicedate;
  final String devicetime;
  final String devicelocation;
  final String batteryperformance;
  final String condition;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    image: json["image"],
    phone: json["phone"],
    devicedate: json["devicedate"],
    devicetime: json["devicetime"],
    devicelocation: json["devicelocation"],
    batteryperformance: json["batteryperformance"],
    condition: json["condition"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "phone": phone,
    "devicedate": devicedate,
    "devicetime": devicetime,
    "devicelocation": devicelocation,
    "batteryperformance": batteryperformance,
    "condition": condition,
  };
}











// class KidDeviceResponse{
//    bool status;
//    String message;
//    String name;
//    String image;
//    String devicedate;
//    String devicetime;
//    String devicelocation;
//    String batteryperformance;
//    String condition;
//    String phone;
//
//   KidDeviceResponse({
//     required this.status,
//     required this.message,
//     required this.name,
//     required this.image,
//     required this.devicedate,
//     required this.devicetime,
//     required this.devicelocation,
//     required this.batteryperformance,
//     required this.condition,
//     required this.phone,
//   });
// }