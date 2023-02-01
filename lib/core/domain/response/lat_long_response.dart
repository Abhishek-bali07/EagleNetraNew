import 'package:eagle_netra/core/common/position.dart';

import '../../common/lat_long.dart';

class LatLongResponse{
  bool status;
  String message;
  List<KidPosition> latlongData;

  LatLongResponse({
    required this.status,
    required this.message,
    required this.latlongData});
}