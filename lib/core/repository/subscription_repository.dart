import '../common/response.dart';
import '../domain/response/kid_details_response.dart';
import '../domain/response/subscription_info_response.dart';

abstract class SubscriptionRepository{
  Future<Resource<KidDetailsInfoResponse>> subscriptionInfo(String smartCardId);
}