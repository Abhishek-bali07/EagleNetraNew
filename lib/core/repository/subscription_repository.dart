import '../common/response.dart';
import '../domain/response/subscription_info_response.dart';

abstract class SubscriptionRepository{
  Future<Resource<SubscriptionInfoResponse>> subscriptionInfo(String smartCardId);
}