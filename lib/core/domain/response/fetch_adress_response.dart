class FetchAddressResponse{
  FetchAddressResponse(
      {
        required this.status,
        required this.message,
        required this.locationAddress,
      });

  bool status;
  String message;
  String locationAddress;
}