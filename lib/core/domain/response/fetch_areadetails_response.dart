import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

import '../../common/lat_long.dart';

AreaDetailsResponse areaDetailsResponseFromJson(String str) => AreaDetailsResponse.fromJson(json.decode(str));

String areaDetailsResponseToJson(AreaDetailsResponse data) => json.encode(data.toJson());

class AreaDetailsResponse extends BusinessObject{
  AreaDetailsResponse({
    required this.status,
    required this.message,
    required this.safeAreaDetails,
  });

  final bool status;
  final String message;
  final SafeAreaDetails safeAreaDetails;

  factory AreaDetailsResponse.fromJson(Map<String, dynamic> json) => AreaDetailsResponse(
    status: json["status"],
    message: json["message"],
    safeAreaDetails: SafeAreaDetails.fromJson(json["safeAreaDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "safeAreaDetails": safeAreaDetails.toJson(),
  };
}

class SafeAreaDetails{
  SafeAreaDetails({
    required this.latLong,
    required this.locationName,
    required this.address,
    required this.radius,
    required this.state,
    required this.safeAreaId,
    required this.alertOn,
  });

  final LatLong latLong;
  final String locationName;
  final String address;
  final double radius;
  final String state;
  final String safeAreaId;
  final String alertOn;

  factory SafeAreaDetails.fromJson(Map<String, dynamic> json) => SafeAreaDetails(
    latLong: LatLong.fromJson(json["latLong"]),
    locationName: json["locationName"],
    address: json["address"],
    radius: json["radius"]?.toDouble(),
    state: json["state"],
    safeAreaId: json["safeAreaId"],
    alertOn: json["alertOn"],
  );

  Map<String, dynamic> toJson() => {
    "latLong": latLong.toJson(),
    "locationName": locationName,
    "address": address,
    "radius": radius,
    "state": state,
    "safeAreaId": safeAreaId,
    "alertOn": alertOn,
  };
}






// class AreaDetailsResponse {
//   AreaDetailsResponse({
//       required this.status,
//       required this.message,
//       required this.areaDetails,
//   });
//
//   final bool status;
//   final String message;
//   SafeAreaDetails areaDetails;
//
// }
// class SafeAreaDetails{
//   SafeAreaDetails({
//     required this.locationName,
//     required this.address,
//     required this.radius,
//     required this.alertOn,
//     required this.state,
//     required this.safeAreaId,
//   });
//
//   String locationName;
//   String address;
//   String radius;
//   String alertOn;
//   bool state;
//   String safeAreaId;
