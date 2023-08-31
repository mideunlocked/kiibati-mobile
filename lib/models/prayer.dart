class Prayer {
  final String id;
  final String categoryId;
  final String prayerPoint;
  final String content;
  final String scripturalReference;

  const Prayer({
    required this.id,
    required this.content,
    required this.categoryId,
    required this.prayerPoint,
    required this.scripturalReference,
  });
}
