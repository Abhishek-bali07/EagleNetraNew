import 'package:eagle_netra/core/common/lat_long.dart';
import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/subscription_info_response.dart';

import '../core/domain/response/kid_details_response.dart';
import '../core/repository/subscription_repository.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository{
  @override
  Future<Resource<KidDetailsInfoResponse>> subscriptionInfo(String smartCardId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(KidDetailsInfoResponse(
        status: true, message: "Success", shortDetails: List.generate(2, (index) => ShortDetail(
        smartCardId: "1", name: "SK ROHAN", age: "17",
        clsName: "11", image: "image",
        activateFrom:DateTime.parse("2023-03-01 15:01:40"),
        expireDate: DateTime.parse("2024-03-01 15:01:40"),
        deviceId: "2245",
        latLongDetails: Kposition(
            postionalTime: DateTime.parse("2023-03-01 12:34:11"), posId: "22D4",
            latLong: LatLong(lat: 22.322920653425398995750583708286285400390625,
                lng: 88.453343333012298899120651185512542724609375)), rechargeAmount: "350"))

    )
    //     SubscriptionInfoResponse(
    //     status: true, message: "Success", subscriptionDetails: List.generate(2, (index) => SubscriptionDetails(
    //     kidId: "1",
    //     name: "Rehana Saha", image: "image", age: "10",
    //     clsname: "class V", expiredOn: "31st Dec 2023",
    //     recharegeAmount: "350"))
    //
    // )
    );
  }


}