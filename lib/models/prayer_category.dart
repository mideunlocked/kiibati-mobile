import 'prayer.dart';

class PrayersCategory {
  final String id;
  final String name;
  final List<Prayer> prayers;

  const PrayersCategory({
    required this.id,
    required this.name,
    required this.prayers,
  });
}
