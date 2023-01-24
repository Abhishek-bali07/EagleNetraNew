class FetchAddressResponse{
  FetchAddressResponse(
      {
        required this.status,
        required this.message,
        required this.locationDetails,
      });

  bool status;
  String message;
  LocationDetails locationDetails;
}


class LocationDetails{
  LocationDetails({
   required this.id,
   required this.name,
  });
   final String id;
   final String name;
}