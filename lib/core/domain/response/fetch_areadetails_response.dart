class AreaDetailsResponse {
  AreaDetailsResponse({
      required this.status,
      required this.message,
      required this.areaDetails,
  });

  final bool status;
  final String message;
  AreaDetails areaDetails;

}
class AreaDetails{
  AreaDetails({
    required this.locationName,
    required this.address,
    required this.radius,
    required this.alertOn,
    required this.state,
    required this.safeAreaId,
  });

  String locationName;
  String address;
  String radius;
  String alertOn;
  bool state;
  String safeAreaId;

}