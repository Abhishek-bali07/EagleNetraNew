import '../common/response.dart';
import '../domain/response/kid_short_info_response.dart';

abstract class SafeAreaRepository{
  Future<Resource<KidShortInfoResponse>> kidShortInfo(String userId);
}