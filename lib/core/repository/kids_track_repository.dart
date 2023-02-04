import '../common/response.dart';
import '../domain/response/lat_long_response.dart';

abstract class KidsTrackRepository{


  Future<Resource<LatLongResponse>> fetchPositions(String kidId, String date,  String userId, String startTime, String endTime);
}