//
// class AddCardResponse {
//   AddCardResponse({
//     required this.status,
//     required this.message,
//     required this.userId,
//     required this.isAdded,
//     required this.cardId,
//   });
//
//
//   bool status;
//   String message;
//   bool isAdded;
//   String userId;
//   String cardId;
//
// }
import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

AddCardResponse addCardResponseFromJson(String str) => AddCardResponse.fromJson(json.decode(str));

String addCardResponseToJson(AddCardResponse data) => json.encode(data.toJson());

class AddCardResponse extends BusinessObject{
  AddCardResponse({
    required this.status,
    required this.message,
    required this.isAdded,
  });

  final bool status;
  final String message;
  final bool isAdded;

  factory AddCardResponse.fromJson(Map<String, dynamic> json) => AddCardResponse(
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

