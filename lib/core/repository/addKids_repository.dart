
import 'dart:io';
import '../common/response.dart';
import '../domain/response/add_card_response.dart';
import '../domain/response/required_profile_details_reponse.dart';
import '../domain/response/short_profile_response.dart';

abstract class AddCardRepository{

  Future<Resource<ShortProfileResponse>> getProfileInittialData(String userId);


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
      File image,


      );
}