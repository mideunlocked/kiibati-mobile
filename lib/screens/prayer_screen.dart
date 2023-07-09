import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../data.dart';
import '../widgets/prayer-widgets/prayer_list_tile.dart';
import '../widgets/prayer-widgets/prayer_screen_app_bar.dart';
import '../widgets/sermon-widgets/sermon_screen_floating_button_widget.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key, required this.title});

  final String title;

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  double textSize = 12.sp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 1.h,
            horizontal: 3.w,
          ),
          child: Column(
            children: [
              // custom app bar
              PrayerSreenAppBar(title: widget.title),

              // prayer list widget
              Expanded(
                child: ListView(
                  children: prayersForMen.map((prayer) {
                    // prayer list tile
                    return PrayerListTile(
                      prayer: prayer,
                      textSize: textSize,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),

      // floating action widget 2 one for increment and decrement
      floatingActionButton: SermonScreenFloatingActionButtons(
        increaseText: () => increaseText(),
        decreaseText: () => decreaseText(),
      ),
    );
  }

  // increment function
  void increaseText() {
    setState(() {
      textSize = textSize + 1;
    });
  }

  // decrement function
  void decreaseText() {
    setState(() {
      textSize = textSize - 1;
    });
  }
}