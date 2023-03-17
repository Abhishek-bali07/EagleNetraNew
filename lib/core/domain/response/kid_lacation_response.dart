import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

import '../../common/lat_long.dart';

KidLocationResponse kidLocationResponseFromJson(String str) => KidLocationResponse.fromJson(json.decode(str));

String kidLocationResponseToJson(KidLocationResponse data) => json.encode(data.toJson());

class KidLocationResponse extends BusinessObject{
  KidLocationResponse({
    required this.status,
    required this.message,
    required this.kidsDetails,
  });

  final bool status;
  final String message;
  final List<KidsDetail> kidsDetails;

  factory KidLocationResponse.fromJson(Map<String, dynamic> json) => KidLocationResponse(
    status: json["status"],
    message: json["message"],
    kidsDetails: List<KidsDetail>.from(json["kidsDetails"].map((x) => KidsDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "kidsDetails": List<dynamic>.from(kidsDetails.map((x) => x.toJson())),
  };
}

class KidsDetail {
  KidsDetail({
    required this.name,
    required this.smartCardId,
    required this.latLong,
  });

  final String name;
  final String smartCardId;
  final LatLong latLong;

  factory KidsDetail.fromJson(Map<String, dynamic> json) => KidsDetail(
    name: json["name"],
    smartCardId: json["smartCardId"],
    latLong: LatLong.fromJson(json["latLong"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "smartCardId": smartCardId,
    "latLong": latLong.toJson(),
  };
}