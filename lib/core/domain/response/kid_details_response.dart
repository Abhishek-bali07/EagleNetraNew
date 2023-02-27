import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

import '../../common/lat_long.dart';

ManagementShortInfoResponse managementShortInfoResponseFromJson(String str) => ManagementShortInfoResponse.fromJson(json.decode(str));

String managementShortInfoResponseToJson(ManagementShortInfoResponse data) => json.encode(data.toJson());

class ManagementShortInfoResponse  extends BusinessObject{
  ManagementShortInfoResponse({
    required this.status,
    required this.message,
    required this.shortDetails,
  });

  final bool status;
  final String message;
  final List<ShortDetail> shortDetails;

  factory ManagementShortInfoResponse.fromJson(Map<String, dynamic> json) => ManagementShortInfoResponse(
    status: json["status"],
    message: json["message"],
    shortDetails: List<ShortDetail>.from(json["shortDetails"].map((x) => ShortDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "shortDetails": List<dynamic>.from(shortDetails.map((x) => x.toJson())),
  };
}

class ShortDetail{
  ShortDetail({
    required this.smartCardId,
    required this.name,
    required this.age,
    required this.clsName,
    required this.image,
    required this.activateFrom,
    required this.deviceId,
    required this.latLongData,
  });

  final String smartCardId;
  final String name;
  final String age;
  final String clsName;
  final String image;
  final DateTime activateFrom;
  final String deviceId;
  final List<KidPosition> latLongData;

  factory ShortDetail.fromJson(Map<String, dynamic> json) => ShortDetail(
    smartCardId: json["smartCardId"],
    name: json["name"],
    age: json["age"],
    clsName: json["clsName"],
    image: json["image"],
    activateFrom: DateTime.parse(json["activateFrom"]),
    deviceId: json["deviceId"],
    latLongData: List<KidPosition>.from(json["latLongData"].map((x) => KidPosition.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "smartCardId": smartCardId,
    "name": name,
    "age": age,
    "clsName": clsName,
    "image": image,
    "activateFrom": activateFrom.toIso8601String(),
    "deviceId": deviceId,
    "latLongData": List<dynamic>.from(latLongData.map((x) => x.toJson())),
  };
}

class KidPosition {
  KidPosition({
    required this.posId,
    required this.postionalTime,
    required this.latLong,
  });

  final String posId;
  final String postionalTime;
  final LatLong latLong;

  factory KidPosition.fromJson(Map<String, dynamic> json) => KidPosition(
    posId: json["posId"],
    postionalTime: json["postionalTime"],
    latLong: LatLong.fromJson(json["latLong"]),
  );

  Map<String, dynamic> toJson() => {
    "posId": posId,
    "postionalTime": postionalTime,
    "latLong": latLong.toJson(),
  };
}