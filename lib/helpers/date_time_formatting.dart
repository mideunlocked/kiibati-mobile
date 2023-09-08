import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DateTimeFormatting {
  List<String> formatTimeDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    DateFormat timeFormat = DateFormat.jm();
    DateFormat dateFormat = DateFormat.MMMMEEEEd();
    String formattedTime = timeFormat.format(dateTime);
    String formattedDate = dateFormat.format(dateTime);

    return [formattedTime, formattedDate];
  }

  String getGreeting() {
    final currentTime = DateTime.now();

    if (currentTime.hour < 12) {
      return 'morning';
    } else if (currentTime.hour < 17) {
      return 'afternoon';
    } else if (currentTime.hour < 20) {
      return 'evening';
    } else {
      return 'night';
    }
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");

    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(":");
  }
}
