import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class KidLiveLocationRepository {
  Future throwLiveLocation(String kidId, LatLng currentLocation);
}