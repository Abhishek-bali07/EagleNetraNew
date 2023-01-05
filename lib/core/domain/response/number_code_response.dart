import 'dart:convert';

import 'package:eagle_netra/core/domain/mobile_number_code.dart';



class NumberCodesResponse {
  NumberCodesResponse(
      {required this.status, required this.message, required this.codes});

  bool status;
  String message;
  List<MobileNumberCode> codes;

}
