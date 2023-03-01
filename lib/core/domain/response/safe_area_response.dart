
import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

SafeareaResponse safeareaResponseFromJson(String str) => SafeareaResponse.fromJson(json.decode(str));


class SafeareaResponse extends BusinessObject {
  SafeareaResponse({
    required this.status,
    required this.message,
    required this.areaDetails,
  });

  final bool status;
  final String message;
  final List<AreaDetails>? areaDetails;

  factory SafeareaResponse.fromJson(Map<String, dynamic> json) => SafeareaResponse(
    status: json["status"],
    message: json["message"],
    areaDetails:json["areaDetails"] != null ? List<AreaDetails>.from(json["areaDetails"].map((x) => AreaDetails.fromJson(x))): null,
  );


}

class AreaDetails {
  AreaDetails({
    required this.safeAreaId,
    required this.locationName,
    required this.address,
    required this.radius,
    required this.state,
    required this.alertOn,
  });

  String safeAreaId;
  String locationName;
  String address;
  String radius;
  bool state;
  String alertOn;

  factory AreaDetails.fromJson(Map<String, dynamic> json) => AreaDetails(
    safeAreaId: json["safeAreaId"],
    locationName: json["locationName"],
    address: json["address"],
    radius: json["radius"],
    state: json["state"],
    alertOn: json["alertOn"],
  );

  Map<String, dynamic> toJson() => {
    "safeAreaId": safeAreaId,
    "locationName": locationName,
    "address": address,
    "radius": radius,
    "state": state,
    "alertOn": alertOn,
  };
}






// class SafeareaResponse {
//   SafeareaResponse({
//       required this.status,
//       required this.message,
//       required this.areaDetails,
//   });
//
//   final bool status;
//   final String message;
//   final List<AreaDetails> areaDetails;
//
// }
// class AreaDetails{
//   AreaDetails({
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
// }