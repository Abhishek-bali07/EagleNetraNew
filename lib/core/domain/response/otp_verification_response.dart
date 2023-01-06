class OtpVerificationResponse {
  OtpVerificationResponse(
      {required this.status,
        required this.message,
        required this.isVerified,
        required this.userId,
        required this.userStatus});

  bool status;
  String message;
  bool isVerified;
  String userId;
  String userStatus;


}