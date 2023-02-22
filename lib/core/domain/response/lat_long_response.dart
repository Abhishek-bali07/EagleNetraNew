import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

import '../../common/lat_long.dart';

LatLongResponse latLongResponseFromJson(String str) => LatLongResponse.fromJson(json.decode(str));

String latLongResponseToJson(LatLongResponse data) => json.encode(data.toJson());

class LatLongResponse extends BusinessObject {
  LatLongResponse({
    required this.status,
    required this.message,
    required this.latlongData,
  });

  final bool status;
  final String message;
  final List<KidPosition> latlongData;

  factory LatLongResponse.fromJson(Map<String, dynamic> json) => LatLongResponse(
    status: json["status"],
    message: json["message"],
    latlongData: List<KidPosition>.from(json["latlongData"].map((x) => KidPosition.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "latlongData": List<dynamic>.from(latlongData.map((x) => x.toJson())),
  };
}

class KidPosition {
  KidPosition({
    required this.posId,
    required this.postionalTime,
    required this.latLong,
  });

  final String posId;
  final DateTime postionalTime;
  final LatLong latLong;

  factory KidPosition.fromJson(Map<String, dynamic> json) => KidPosition(
    posId: json["posId"],
    postionalTime: DateTime.parse(json["postionalTime"]),
    latLong: LatLong.fromJson(json["latLong "]),
  );

  Map<String, dynamic> toJson() => {
    "posId": posId,
    "postionalTime": postionalTime.toIso8601String(),
    "latLong ": latLong.toJson(),
  };
}




//
// import 'package:eagle_netra/core/common/position.dart';
//
// import '../../common/lat_long.dart';
//
// class LatLongResponse{
//   bool status;
//   String message;
//   List<KidPosition> latlongData;
//
//   LatLongResponse({
//     required this.status,
//     required this.message,
//     required this.latlongData});
// }
//
// class  KidPosition{
//   String posId;
//   LatLong latLong;
//   String postionalTime;
//
//   KidPosition({
//     required this.posId,
//     required this.latLong,
//     required this.postionalTime,
//   });
// }