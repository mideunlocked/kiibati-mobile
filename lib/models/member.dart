class Member {
  final String id;
  final String imageUrl;
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String emailAddress;

  const Member({
    required this.id,
    this.imageUrl = "",
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.emailAddress,
  });
}
