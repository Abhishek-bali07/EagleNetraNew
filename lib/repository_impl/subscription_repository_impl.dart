import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/subscription_info_response.dart';

import '../core/repository/subscription_repository.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository{
  @override
  Future<Resource<SubscriptionInfoResponse>> subscriptionInfo(String smartCardId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(SubscriptionInfoResponse(
        status: true, message: "Success", subscriptionDetails: List.generate(2, (index) => SubscriptionDetails(
        kidId: "1",
        name: "Rehana Saha", image: "image", age: "10",
        clsname: "class V", expiredOn: "31st Dec 2023",
        recharegeAmount: "350"))

    ));
  }

}