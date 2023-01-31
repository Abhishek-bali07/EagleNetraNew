


import 'dart:convert';

import 'package:eagle_netra/core/domain/response/business_object.dart';

BaseUrlResponse baseUrlResponseFromJson(String str) => BaseUrlResponse.fromJson(json.decode(str));

String baseUrlResponseToJson(BaseUrlResponse data) => json.encode(data.toJson());

class BaseUrlResponse extends BusinessObject{
  BaseUrlResponse({
    required this.status,
    required this.message,
    required this.baseUrl,
  });

  final bool status;
  final String message;
  final String baseUrl;

  factory BaseUrlResponse.fromJson(Map<String, dynamic> json) => BaseUrlResponse(
    status: json["status"],
    message: json["message"],
    baseUrl: json["baseUrl"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "baseUrl": baseUrl,
  };
}


