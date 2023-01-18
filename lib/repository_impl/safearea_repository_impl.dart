import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/kid_short_info_response.dart';

import '../core/repository/safearea_repository.dart';

class SafeareaRepositoryImpl implements SafeAreaRepository{
  @override
  Future<Resource<KidShortInfoResponse>> kidShortInfo(String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(
        KidShortInfoResponse(
            status: true,
          message: "Success", shortDetails: List.generate(1, (index) => ShortDetails(
            name: "Druv Sen",
            image: "image",
            age: "10",
            clsname: "Class V",
            expiredOn: "31st Dec, 2023",
            activateFrom: "1st Jan 2023")),
        )
    );
  }

}