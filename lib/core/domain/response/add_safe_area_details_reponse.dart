import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';


AddSafeAreaDetailsResponse addSafeAreaDetailsResponseFromJson(String str) => AddSafeAreaDetailsResponse.fromJson(json.decode(str));

String addSafeAreaDetailsResponseToJson(AddSafeAreaDetailsResponse data) => json.encode(data.toJson());

class AddSafeAreaDetailsResponse  extends BusinessObject{
  AddSafeAreaDetailsResponse({
    required this.status,
    required this.message,
    required this.isSaved,
  });

  final bool status;
  final String message;
  final bool isSaved;

  factory AddSafeAreaDetailsResponse.fromJson(Map<String, dynamic> json) => AddSafeAreaDetailsResponse(
    status: json["status"],
    message: json["message"],
    isSaved: json["isSaved"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "isSaved": isSaved,
  };
}

//
// class AddSafeAreaDetailsResponse{
//   AddSafeAreaDetailsResponse(
//       {
//         required this.status,
//         required this.message,
//         required this.isSaved,
//       });
//
//   bool status;
//   String message;
//   bool isSaved;
// }