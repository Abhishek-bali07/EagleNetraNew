class KidShortInfoResponse  {
  KidShortInfoResponse({
    required this.status,
    required this.message,
    required this.shortDetails,
  });

  final bool status;
  final String message;
  final List<ShortDetails> shortDetails;
}

class ShortDetails {
  ShortDetails({
    required this.name,
    required this.image,
    required this.age,
    required this.clsname,
    required this.expiredOn,
    required this.activateFrom,
  });

  final String name;
  final String image;
  final String age;
  final String clsname;
  final String activateFrom;
  final String expiredOn;

}