class Pastors {
  final String id;
  final String imageUrl;
  final String fullName;
  final String position;
  final List<dynamic> sermons;

  const Pastors({
    required this.id,
    required this.position,
    required this.fullName,
    required this.imageUrl,
    required this.sermons,
  });
}
