class SubscriptionInfoResponse{
  SubscriptionInfoResponse({
    required this.status,
    required this.message,
    required this.subscriptionDetails,
  });

  final bool status;
  final String message;
  final List<SubscriptionDetails> subscriptionDetails;
}
class SubscriptionDetails{
  SubscriptionDetails({
    required this.kidId,
    required this.name,
    required this.image,
    required this.age,
    required this.clsname,
    required this.expiredOn,
    required this.recharegeAmount,
  });
  final String kidId;
  final String name;
  final String image;
  final String age;
  final String clsname;
  final String expiredOn;
  final String recharegeAmount;

}
