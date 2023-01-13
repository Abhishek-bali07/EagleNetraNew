class FetchProfileDetailsResponse{
  FetchProfileDetailsResponse({
  required this.status,
  required this.message,
  required this.name,
  required this.email,
  required this.mobile});


  bool status;
  String message;
  String name;
  String email;
  String mobile;
}