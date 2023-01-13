import 'dart:io';

import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/add_card_response.dart';

import '../core/domain/response/required_profile_details_reponse.dart';
import '../core/repository/addKids_repository.dart';

class AddKidsUseCaseImpl extends AddCardRepository{


  @override
  Future<Resource<AddCardResponse>> addKids(String userId, String kidname, String cardNumber, String deviceId, String addCls, String age, String number1, String number2, String number3, File image) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(
        AddCardResponse(status: true,
          message: "Success",
          userId: '',
          isAdded: true,
          cardId: '',)
    );
  }

  @override
  Future<Resource<FetchProfileDetailsResponse>> getProfileInittialData(String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(FetchProfileDetailsResponse(
      status: true,
      message: "Success",
      name: "Abhishek Sen",
      email: "abc@gmail.com",
      mobile: "8885552222"
    ));
  }
  
}