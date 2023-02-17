import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

FetchAddressResponse fetchAddressResponseFromJson(String str) => FetchAddressResponse.fromJson(json.decode(str));

String fetchAddressResponseToJson(FetchAddressResponse data) => json.encode(data.toJson());

class FetchAddressResponse extends BusinessObject{
  FetchAddressResponse({
    required this.status,
    required this.message,
    required this.locationDetails,
  });

  final bool status;
  final String message;
  final String locationDetails;

  factory FetchAddressResponse.fromJson(Map<String, dynamic> json) => FetchAddressResponse(
    status: json["status"],
    message: json["message"],
    locationDetails: json["locationDetails"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "locationDetails": locationDetails,
  };
}





// class FetchAddressResponse{
//   FetchAddressResponse(
//       {
//         required this.status,
//         required this.message,
//         required this.locationDetails,
//       });
//
//   bool status;
//   String message;
//   String locationDetails;
// }
//
//
// class LocationDetails{
//   LocationDetails({
//    required this.id,
//    required this.name,
//   });
//    final String id;
//    final String name;
// }