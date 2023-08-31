import 'package:cloud_firestore/cloud_firestore.dart';

class Sermon {
  final String id;
  final String by;
  final String title;
  final String category;
  final String videoLink;
  final String audioLink;
  final String imageUrl;
  final String serviceType;
  final bool isDownloaded;
  final List<dynamic> sermonText;
  final String scripturalReference;
  final Timestamp timestamp;

  const Sermon({
    required this.id,
    required this.by,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.videoLink,
    required this.audioLink,
    required this.sermonText,
    required this.serviceType,
    required this.isDownloaded,
    required this.timestamp,
    required this.scripturalReference,
  });
}
