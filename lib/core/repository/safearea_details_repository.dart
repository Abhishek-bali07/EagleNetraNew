import 'package:eagle_netra/core/common/response.dart';

import '../domain/response/add_safe_area_details_reponse.dart';
import '../domain/response/fetch_adress_response.dart';

abstract class SafeAreaDetailsRepository{

  Future<Resource<FetchAddressResponse>> fetchAddress(double longitude, double latitude);



  Future<Resource<AddSafeAreaDetailsResponse>> uploadLocationDetails(
      String userId,
      String smartCardId,
      String locationName,
      String locationAddress,
      bool valuefirst,
      bool valuesecond,
      double radius,
      );
}