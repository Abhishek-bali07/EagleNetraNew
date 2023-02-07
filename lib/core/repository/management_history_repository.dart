import 'package:eagle_netra/core/common/response.dart';

import '../domain/response/management_history_response.dart';

abstract class ManagementHistoryRepository{
  Future<Resource<ManagementShortInfoResponse>> ManagementHistoryInfo(String userId);
}