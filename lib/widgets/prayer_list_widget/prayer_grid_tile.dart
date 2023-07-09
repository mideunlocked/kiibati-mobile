import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../screens/prayer_screen.dart';

class PrayerGridTile extends StatelessWidget {
  const PrayerGridTile({
    super.key,
    required this.prayerTitle,
    required this.index,
  });

  final String prayerTitle;
  final int index;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => PrayerScreen(
              title: prayerTitle,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primaryColor,
              primaryColor.withOpacity(0.5),
            ],
            begin: index.isEven ? Alignment.centerLeft : Alignment.centerRight,
            end: index.isEven ? Alignment.centerRight : Alignment.centerLeft,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 4.w),
        child: Text(
          prayerTitle,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
