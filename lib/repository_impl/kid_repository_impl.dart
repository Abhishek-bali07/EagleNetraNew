import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/kid_short_info_response.dart';

import '../core/repository/kid_repository.dart';

class KidRepositoryImpl implements KidAccountRepository{
  @override
  Future<Resource<KidShortInfoResponse>> kidShortInfo(String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(
      KidShortInfoResponse(
        status: true,
        message: "Success", shortDetails: List.generate(3,
              (index) => ShortDetails(
                  name: "Druv Sen",
                  image: "image",
                  age: "10",
                  clsname: "Class V",
                  expiredOn: "31st Dec, 2023",
                  activateFrom: "1st Jan 2023")),
        // shortDetails: ShortDetails(name: "Druv Sen", age: "12", clsname: "VI", expiredOn: "31st dec 2023", activateFrom: "1st Jan 2023", image: "assets/images/userimg.png")

      )
    );
  }

}