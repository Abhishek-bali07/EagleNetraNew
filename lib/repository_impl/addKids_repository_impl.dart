import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/add_card_response.dart';
import 'package:eagle_netra/utils/api_client_configuration.dart';
import 'package:eagle_netra/utils/extensions.dart';

import '../core/domain/response/required_profile_details_reponse.dart';
import '../core/domain/response/short_profile_response.dart';
import '../core/repository/addKids_repository.dart';
import '../data/online/addcard_api.dart';

class AddKidsUseCaseImpl implements AddCardRepository{
  final Dio _dio;
  late final AddcardApi _addcardApi;

  AddKidsUseCaseImpl(this._dio){
    _dio.options = ApiClientConfiguration.initialConfiguration;
    _addcardApi = AddcardApi(_dio);
  }



  @override
  Future<Resource<AddCardResponse>> addKids(
      String userId,
      String kidname,
      String cardNumber,
      String deviceId,
      String addCls,
      String age,
      String number1,
      String number2,
      String number3,
      File image) async {
    return _addcardApi
        .addCardDetails(userId, kidname, deviceId, cardNumber, addCls, age, image, number1, number2, number3)
        .handleResponse<AddCardResponse>();

    // await Future.delayed(const Duration(seconds: 2));
    // return Success(
    //     AddCardResponse(status: true,
    //       message: "Success",
    //       isAdded: true,
    //       )
    // );
  }

  @override
  Future<Resource<ShortProfileResponse>> getProfileInittialData(String userId) async {
  return _addcardApi
      .getUserDetails(userId)
      .handleResponse<ShortProfileResponse>();

    // await Future.delayed(const Duration(seconds: 2));
    // return Success(FetchProfileDetailsResponse(
    //   status: true,
    //   message: "Success",
    //   data:Data( name: "Abhishek Sen",
    //     email: "abc@gmail.com",
    //     number: "8885552222", image: '',),
    //
    // ));
  }
  
}