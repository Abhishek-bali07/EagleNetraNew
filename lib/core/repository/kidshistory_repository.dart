import '../common/response.dart';
import '../domain/response/kid_details_response.dart';
import '../domain/response/kid_short_info_response.dart';

abstract class KidsHistoryRepository{
  Future<Resource<KidDetailsInfoResponse>> kidsHistoryInfo(String userId);
}