import 'package:eagle_netra/core/common/response.dart';
import 'package:eagle_netra/core/domain/response/batch_call_response.dart';

abstract class MainRepository{
  Future<Resource<BatchCallResponse>> getIntroPageData();
}