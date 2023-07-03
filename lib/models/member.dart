class Member {
  final String id;
  final String imageUrl;
  final String fullName;
  final String mobileNumber;
  final String emailAddress;

  const Member({
    required this.id,
    this.imageUrl = "",
    required this.fullName,
    required this.mobileNumber,
    required this.emailAddress,
  });
}
