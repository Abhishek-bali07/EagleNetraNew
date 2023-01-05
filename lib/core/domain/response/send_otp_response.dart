class SendOtpResponse  {
  SendOtpResponse(
      {required this.status,
        required this.message,
        required this.isSend});

  bool status;
  String message;
  bool isSend;
}
