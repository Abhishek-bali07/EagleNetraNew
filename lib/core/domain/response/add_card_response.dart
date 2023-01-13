
class AddCardResponse {
  AddCardResponse({
    required this.status,
    required this.message,
    required this.userId,
    required this.isAdded,
    required this.cardId,
  });


  bool status;
  String message;
  bool isAdded;
  String userId;
  String cardId;

}
