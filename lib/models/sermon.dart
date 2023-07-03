class Sermon {
  final String id;
  final String by;
  final String title;
  final String category;
  final String videoLink;
  final String audioLink;
  final String serviceType;
  final bool isDownloaded;
  final List<dynamic> sermonText;
  final List<dynamic> scripturalReference;

  const Sermon({
    required this.id,
    required this.by,
    required this.title,
    required this.category,
    required this.videoLink,
    required this.audioLink,
    required this.sermonText,
    required this.serviceType,
    required this.isDownloaded,
    required this.scripturalReference,
  });
}
