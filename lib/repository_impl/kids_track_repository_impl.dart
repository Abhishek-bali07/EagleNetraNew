import 'package:eagle_netra/core/common/response.dart';

import 'package:eagle_netra/core/domain/response/lat_long_response.dart';

import '../core/common/lat_long.dart';
import '../core/common/position.dart';
import '../core/repository/kids_track_repository.dart';

class KidsTrackRepositoryImpl implements KidsTrackRepository{
  @override
  Future<Resource<LatLongResponse>> fetchPositions(String kidId, String date, userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(LatLongResponse(status: true,
        message: "Success", latlongData: List.generate(6, (index) => KidPosition(
            posId: "1", latLong: LatLong(lat: 22.63355, lng:  88.35533), postionalTime: "${index+2}:00PM"))));
  }

}