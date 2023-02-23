import '../common/response.dart';
import '../domain/response/lat_long_response.dart';

abstract class KidsTrackRepository{


  Future<Resource<LatLongResponse>> fetchPositions(String smartCardId, String date, String startTime, String endTime);
}