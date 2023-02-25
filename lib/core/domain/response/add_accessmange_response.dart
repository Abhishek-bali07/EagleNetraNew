import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

AddAccessResponse addAccessResponseFromJson(String str) => AddAccessResponse.fromJson(json.decode(str));

String addAccessResponseToJson(AddAccessResponse data) => json.encode(data.toJson());

class AddAccessResponse extends BusinessObject {
  AddAccessResponse({
    required this.status,
    required this.message,
    required this.isAdded,
  });

  final bool status;
  final String message;
  final bool isAdded;

  factory AddAccessResponse.fromJson(Map<String, dynamic> json) => AddAccessResponse(
    status: json["status"],
    message: json["message"],
    isAdded: json["isAdded"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "isAdded": isAdded,
  };
}






// class AddAccessResponse{
//   AddAccessResponse({
//     required this.status,
//     required this.message,
//     required this.isAdded,
//
//   });
//
//
//   bool status;
//   String message;
//   bool isAdded;
// }