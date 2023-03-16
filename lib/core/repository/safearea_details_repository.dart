import 'dart:async';

import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/response/safe_area_response.dart';

import '../domain/response/add_safe_area_details_reponse.dart';
import '../domain/response/fetch_adress_response.dart';
import '../domain/response/fetch_areadetails_response.dart';


abstract class SafeAreaDetailsRepository{

  Future<Resource<AreaDetailsResponse>> fetchSafeAreaDetails(String smartCardId, String safeAreaId);

  Future<Resource<FetchAddressResponse>> fetchAddress(double latitude, double longitude);



  Future<Resource<AddSafeAreaDetailsResponse>> uploadLocationDetails(
      String userId,
      String smartCardId,
      double latitude,
      double longitude,
      String locationName,
      String locationAddress,
      bool valuefirst,
      bool valuesecond,
      double radius,
      String safeAreaId,
      );
}