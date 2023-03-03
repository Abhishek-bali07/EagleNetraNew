import '../common/response.dart';
import '../domain/response/kid_details_response.dart';
import '../domain/response/kid_short_info_response.dart';

abstract class KidAccountRepository{
  Future<Resource<KidDetailsInfoResponse>> kidShortInfo(String userId);
}