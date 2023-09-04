class Pastor {
  final String id;
  final String imageUrl;
  final String fullName;
  final String position;
  final String title;
  final List<dynamic> sermons;

  const Pastor({
    required this.id,
    required this.title,
    required this.position,
    required this.fullName,
    required this.imageUrl,
    required this.sermons,
  });
}
