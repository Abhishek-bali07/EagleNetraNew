import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

ManagementShortInfoResponse managementShortInfoResponseFromJson(String str) => ManagementShortInfoResponse.fromJson(json.decode(str));

String managementShortInfoResponseToJson(ManagementShortInfoResponse data) => json.encode(data.toJson());

class ManagementShortInfoResponse extends BusinessObject{
  ManagementShortInfoResponse({
    required this.status,
    required this.message,
    required this.accessDetails,
  });

  final bool status;
  final String message;
  final List<AccessDetails> accessDetails;

  factory ManagementShortInfoResponse.fromJson(Map<String, dynamic> json) => ManagementShortInfoResponse(
    status: json["status"],
    message: json["message"],
    accessDetails: json["accessDetails"] != null ? List<AccessDetails>.from(json["accessDetails"].map((x) => AccessDetails.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "accessDetails": List<dynamic>.from(accessDetails.map((x) => x.toJson())),
  };
}

class AccessDetails {
  AccessDetails({
    required this.name,
    required this.image,
    required this.relationName,
  });

  final String name;
  final String image;
  final String relationName;

  factory AccessDetails.fromJson(Map<String, dynamic> json) => AccessDetails(
    name: json["name"],
    image: json["image"],
    relationName: json["relationName"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "relationName": relationName,
  };
}







// class ManagementShortInfoResponse{
//   ManagementShortInfoResponse({
//     required this.status,
//     required this.message,
//     required this.accessDetails,
//   });
//
//   final bool status;
//   final String message;
//   final List<AccessDetails> accessDetails;
// }
//
// class AccessDetails {
//   AccessDetails({
//
//     required this.name,
//     required this.image,
//     required this.relationName,
//
//   });
//
//   final String name;
//   final String image;
//   final String relationName;
//
//
// }