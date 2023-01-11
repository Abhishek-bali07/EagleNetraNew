

class RegisterUserResponse {
  RegisterUserResponse({
    required this.status,
    required this.message,
    required this.userId,
    required this.userStatus,
    required this.isVerified
  });


  bool status;
  String message;
  bool isVerified;
  String userId;
  String userStatus;


}
