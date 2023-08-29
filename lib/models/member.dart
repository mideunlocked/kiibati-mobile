class Member {
  final String id;
  final String imageUrl;
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String emailAddress;
  final int age;
  final String maritalStatus;
  final String profession;
  final String dateOfBirth;

  const Member({
    required this.id,
    this.imageUrl = "",
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.emailAddress,
    required this.age,
    required this.maritalStatus,
    required this.profession,
    required this.dateOfBirth,
  });
}
