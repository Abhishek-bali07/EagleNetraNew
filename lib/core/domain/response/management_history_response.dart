class ManagementShortInfoResponse{
  ManagementShortInfoResponse({
    required this.status,
    required this.message,
    required this.accessDetails,
  });

  final bool status;
  final String message;
  final List<AccessDetails> accessDetails;
}

class AccessDetails {
  AccessDetails({

    required this.name,
    required this.image,
    required this.relationName,

  });

  final String name;
  final String image;
  final String relationName;


}