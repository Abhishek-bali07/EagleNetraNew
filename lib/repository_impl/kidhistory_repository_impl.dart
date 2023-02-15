import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/kid_short_info_response.dart';

import '../core/repository/kidshistory_repository.dart';

class KidsHistoryRepositoryImpl implements KidsHistoryRepository{
  @override
  Future<Resource<KidShortInfoResponse>> kidsHistoryInfo(String userId, String deviceId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(KidShortInfoResponse(
      status: true,
      message: "Success", shortDetails: List.generate(2,
            (index) => ShortDetails(
            kidId: "1",
            name: "Rehana Saha",
            image: "image",
            age: "10",
            clsname: "Class V",
            expiredOn: "31st Dec, 2023",
            activateFrom: "1st Jan 2023", deviceId: "2233")),


    ));
  }

}