class SafeareaResponse {
  SafeareaResponse({
      required this.status,
      required this.message,
      required this.areaDetails,
  });

  final bool status;
  final String message;
  final List<AreaDetails> areaDetails;

}
class AreaDetails{
  AreaDetails({
    required this.locationName,
    required this.address,
    required this.radious,
    required this.alertOn,
    required this.state,
    required this.safeAreaId,
  });

  String locationName;
  String address;
  String radious;
  String alertOn;
  bool state;
  String safeAreaId;
}