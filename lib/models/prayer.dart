class Prayer {
  final String id;
  final String categoryId;
  final String prayerPoint;
  final List<String> scripturalReference;

  const Prayer({
    required this.id,
    required this.categoryId,
    required this.prayerPoint,
    required this.scripturalReference,
  });
}
