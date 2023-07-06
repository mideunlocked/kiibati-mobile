import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

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
    final formatter = DateFormat.Hm();

    final morningStartTime = formatter.parse('06:00');
    final afternoonStartTime = formatter.parse('12:00');
    final eveningStartTime = formatter.parse('18:00');

    if (currentTime.isAfter(eveningStartTime)) {
      return 'Evening';
    } else if (currentTime.isAfter(afternoonStartTime)) {
      return 'Afternoon';
    } else if (currentTime.isAfter(morningStartTime)) {
      return 'Morning';
    } else {
      return 'Night';
    }
  }

  String timeAgo(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    var dateTimeAgo = timeago.format(dateTime, locale: "en_short");

    return dateTimeAgo;
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
