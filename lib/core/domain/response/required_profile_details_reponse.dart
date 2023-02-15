import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

FetchProfileDetailsResponse fetchProfileDetailsResponseFromJson(String str) => FetchProfileDetailsResponse.fromJson(json.decode(str));

String fetchProfileDetailsResponseToJson(FetchProfileDetailsResponse data) => json.encode(data.toJson());

class FetchProfileDetailsResponse  extends BusinessObject{
  FetchProfileDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final Data data;

  factory FetchProfileDetailsResponse.fromJson(Map<String, dynamic> json) => FetchProfileDetailsResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.name,
    required this.email,
    required this.image,
    required this.number,
  });

  final String name;
  final String email;
  final String image;
  final String number;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    image: json["image"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "image": image,
    "number": number,
  };
}




// class FetchProfileDetailsResponse{
//   FetchProfileDetailsResponse({
//   required this.status,
//   required this.message,
//   required this.name,
//   required this.email,
//   required this.mobile});
//
//
//   bool status;
//   String message;
//   String name;
//   String email;
//   String mobile;
// }
