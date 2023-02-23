
import 'package:eagle_netra/core/common/position.dart';

import '../../common/lat_long.dart';

class KidPositionResponse{
  bool status;
  String message;
  List<KidPosition> latlongData;

  KidPositionResponse({
    required this.status,
    required this.message,
    required this.latlongData});
}

class  KidPosition{
  String posId;
  LatLong latLong;
  String postionalTime;

  KidPosition({
    required this.posId,
    required this.latLong,
    required this.postionalTime,
  });
}