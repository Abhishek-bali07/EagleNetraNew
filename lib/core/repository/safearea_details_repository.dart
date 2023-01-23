import 'package:eagle_netra/core/common/response.dart';

import '../domain/response/add_safe_area_details_reponse.dart';
import '../domain/response/fetch_adress_response.dart';

abstract class SafeAreaDetailsRepository{

  Future<Resource<FetchAddressResponse>> fetchAdress(String userId, String kidId);



  Future<Resource<AddSafeAreaDetailsResponse>> uploadLocationDetails(
      String userId,
      String kidId,
      String locationName,
      String locationAddress,
      String alert,
      String radious,
      );
}