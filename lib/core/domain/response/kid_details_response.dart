import 'dart:convert';


import 'package:eagle_netra/core/common/lat_long.dart';
import 'package:eagle_netra/core/domain/response/business_object.dart';

import 'kid_position_response.dart';


KidDetailsInfoResponse kidDetailsInfoResponseFromJson(String str) => KidDetailsInfoResponse.fromJson(json.decode(str));

String kidDetailsInfoResponseToJson(KidDetailsInfoResponse data) => json.encode(data.toJson());

class KidDetailsInfoResponse  extends BusinessObject{
  KidDetailsInfoResponse({
    required this.status,
    required this.message,
    required this.shortDetails,
  });

  final bool status;
  final String message;
  final List<ShortDetail> shortDetails;

  factory KidDetailsInfoResponse.fromJson(Map<String, dynamic> json) => KidDetailsInfoResponse(
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
    required this.latLongDetails,
  });

  final String smartCardId;
  final String name;
  final String age;
  final String clsName;
  final String image;
  final DateTime activateFrom;
  final String deviceId;
  final Kposition? latLongDetails;

  factory ShortDetail.fromJson(Map<String, dynamic> json) => ShortDetail(
    smartCardId: json["smartCardId"],
    name: json["name"],
    age: json["age"],
    clsName: json["clsName"],
    image: json["image"],
    activateFrom: DateTime.parse(json["activateFrom"]),
    deviceId: json["deviceId"],
    latLongDetails: json["latLong"] != null ? Kposition.fromJson(json["latLong"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "smartCardId": smartCardId,
    "name": name,
    "age": age,
    "clsName": clsName,
    "image": image,
    "activateFrom": activateFrom.toIso8601String(),
    "deviceId": deviceId,
    "latLong": latLongDetails,
  };
}

class Kposition {
  Kposition({
    required this.postionalTime,
    required this.posId,
    required this.latLong,
  });

  final DateTime postionalTime;
  final String posId;
  final LatLong latLong;

  factory Kposition.fromJson(Map<String, dynamic> json) => Kposition(
    postionalTime: DateTime.parse(json["postionalTime"]),
    posId: json["posId"],
    latLong: LatLong.fromJson(json["latLong"]),
  );

  Map<String, dynamic> toJson() => {
    "postionalTime": postionalTime.toIso8601String(),
    "posId": posId,
    "latLong": latLong.toJson(),
  };
}

