import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/add_safe_area_details_reponse.dart';

import 'package:eagle_netra/core/domain/response/fetch_adress_response.dart';

import '../core/repository/safearea_details_repository.dart';

class SafeareaDetailsUseCaseImpl extends SafeAreaDetailsRepository{
  @override
  Future<Resource<FetchAddressResponse>> fetchAddress(double longitude, double latitude) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(FetchAddressResponse(
      status: true,
      message: "Success",
      locationDetails:LocationDetails(id: "1", name: "243, Grand Trunk Rd, N, Liluah, Howrah, West Bengal 711204"),
    ));
  }

  @override
  Future<Resource<AddSafeAreaDetailsResponse>> uploadLocationDetails(
      String userId,
      String smartCardId,
      String locationName,
      String locationAddress,
      bool valuefirst,
      bool valuesecond,
      double radius) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(AddSafeAreaDetailsResponse(
        status: true,
        message: "Success",
        isSaved: true
    ));
  }

}