import '../common/response.dart';
import '../domain/response/kid_short_info_response.dart';

abstract class KidAccountRepository{
  Future<Resource<KidShortInfoResponse>> kidShortInfo(String userId);
}