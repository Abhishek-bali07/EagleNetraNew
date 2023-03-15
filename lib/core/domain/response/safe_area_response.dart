
import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

import '../../common/lat_long.dart';


SafeareaResponse safeareaResponseFromJson(String str) => SafeareaResponse.fromJson(json.decode(str));

String safeareaResponseToJson(SafeareaResponse data) => json.encode(data.toJson());

class SafeareaResponse extends BusinessObject{
  SafeareaResponse({
    required this.status,
    required this.message,
    required this.areaDetails,
  });

  final bool status;
  final String message;
  final List<AreaDetails> areaDetails;

  factory SafeareaResponse.fromJson(Map<String, dynamic> json) => SafeareaResponse(
    status: json["status"],
    message: json["message"],
    areaDetails: List<AreaDetails>.from(json["areaDetails"].map((x) => AreaDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "areaDetails": List<dynamic>.from(areaDetails.map((x) => x.toJson())),
  };
}

class AreaDetails {
  AreaDetails({
    required this.safeAreaId,
    required this.locationName,
    required this.address,
    required this.radius,
    required this.state,
    required this.alertOn,
    required this.latLong,
  });

  final String safeAreaId;
  final String locationName;
  final String address;
  final double radius;
  bool state;
  final String alertOn;
  final AreaDetailLatLong? latLong;

  factory AreaDetails.fromJson(Map<String, dynamic> json) => AreaDetails(
    safeAreaId: json["safeAreaId"],
    locationName: json["locationName"],
    address: json["address"],
    radius: json["radius"]?.toDouble(),
    state: json["state"],
    alertOn: json["alertOn"],
    latLong: json["latLong"] != null ? AreaDetailLatLong.fromJson(json["latLong"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "safeAreaId": safeAreaId,
    "locationName": locationName,
    "address": address,
    "radius": radius,
    "state": state,
    "alertOn": alertOn,
    "latLong": latLong,
  };
}

class AreaDetailLatLong {
  AreaDetailLatLong({
    required this.postionalTime,
    required this.posId,
    required this.latLong,
  });

  final DateTime postionalTime;
  final String posId;
  final LatLong latLong;

  factory AreaDetailLatLong.fromJson(Map<String, dynamic> json) => AreaDetailLatLong(
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

// SafeareaResponse safeareaResponseFromJson(String str) => SafeareaResponse.fromJson(json.decode(str));
//
// String safeareaResponseToJson(SafeareaResponse data) => json.encode(data.toJson());
//
// class SafeareaResponse extends BusinessObject{
//   SafeareaResponse({
//     required this.status,
//     required this.message,
//     required this.areaDetails,
//   });
//
//   final bool status;
//   final String message;
//   final List<AreaDetails> areaDetails;
//
//   factory SafeareaResponse.fromJson(Map<String, dynamic> json) => SafeareaResponse(
//     status: json["status"],
//     message: json["message"],
//     areaDetails: List<AreaDetails>.from(json["areaDetails"].map((x) => AreaDetails.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "areaDetails": List<dynamic>.from(areaDetails.map((x) => x.toJson())),
//   };
// }
//
// class AreaDetails {
//   AreaDetails({
//     required this.safeAreaId,
//     required this.locationName,
//     required this.address,
//     required this.radius,
//     required this.state,
//     required this.alertOn,
//     required this.latLong,
//   });
//
//   final String safeAreaId;
//   final String locationName;
//   final String address;
//   final double radius;
//   bool state;
//   final String alertOn;
//   final AreaDetailLatLong latLong;
//
//   factory AreaDetails.fromJson(Map<String, dynamic> json) => AreaDetails(
//     safeAreaId: json["safeAreaId"],
//     locationName: json["locationName"],
//     address: json["address"],
//     radius: json["radius"]?.toDouble(),
//     state: json["state"],
//     alertOn: json["alertOn"],
//     latLong: AreaDetailLatLong.fromJson(json["latLong"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "safeAreaId": safeAreaId,
//     "locationName": locationName,
//     "address": address,
//     "radius": radius,
//     "state": state,
//     "alertOn": alertOn,
//     "latLong": latLong.toJson(),
//   };
// }
//
// class AreaDetailLatLong {
//   AreaDetailLatLong({
//     required this.postionalTime,
//     required this.posId,
//     required this.latLong,
//   });
//
//   final DateTime postionalTime;
//   final String posId;
//   final LatLong latLong;
//
//   factory AreaDetailLatLong.fromJson(Map<String, dynamic> json) => AreaDetailLatLong(
//     postionalTime: DateTime.parse(json["postionalTime"]),
//     posId: json["posId"],
//     latLong: LatLong.fromJson(json["latLong"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "postionalTime": postionalTime.toIso8601String(),
//     "posId": posId,
//     "latLong": latLong.toJson(),
//   };
// }






