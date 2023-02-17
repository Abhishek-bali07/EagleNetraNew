import '../common/response.dart';
import '../domain/response/activate_switch_response.dart';
import '../domain/response/kid_short_info_response.dart';
import '../domain/response/safe_area_response.dart';

abstract class SafeAreaRepository{
  Future<Resource<SafeareaResponse>> kidShortInfo(String userId, String smartCardId);

  Future<Resource<ActivateSwitchResponse>> AddSafearea(String safeAreaId, bool state);
}