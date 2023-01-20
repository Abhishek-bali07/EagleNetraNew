import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/response/activate_switch_response.dart';

import 'package:eagle_netra/core/domain/response/kid_short_info_response.dart';
import 'package:eagle_netra/core/domain/response/safe_area_response.dart';

import '../core/repository/safearea_repository.dart';

class SafeareaRepositoryImpl implements SafeAreaRepository{
  @override
  Future<Resource<SafeareaResponse>> kidShortInfo(String userId,String kidId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(
        SafeareaResponse(
          status: true,
          message: "Success",
          areaDetails: List.generate(1, (index) => AreaDetails(
              locationName: "Rehana School",
              address: "243, Grand Trunk Rd, N, Liluah, Howrah, West Bengal 711204",
              radious: "100m",
              alertOn: "Entry & Exit",
              state: true, safeAreaId: ''))
        )
    );
  }

  @override
  Future<Resource<ActivateSwitchResponse>> AddSafearea(String userId, String kidId, String safeAreaId, bool state) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(
      ActivateSwitchResponse(
        status: true,
        message: "Success",
        isActivate: true,
        
        
      )
    );
  }

 


}