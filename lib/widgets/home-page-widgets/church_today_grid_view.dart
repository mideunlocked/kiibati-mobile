import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import '../../providers/church_today_provider.dart';
import '../church_today_widgets/bible_study_widget.dart';
import '../church_today_widgets/bible_verse_widget.dart';
import '../church_today_widgets/choir_ministration_widget.dart';
import '../church_today_widgets/church_highlight_widget.dart';
import '../church_today_widgets/latest_sermon_widget.dart';
import '../church_today_widgets/prayer_for_week_widget.dart';
import 'church_today_container.dart';

class ChurchTodayGridView extends StatelessWidget {
  const ChurchTodayGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;
    var churchTodayProvider = Provider.of<ChurchTodayProvier>(context);

    return GridView(
      padding: EdgeInsets.only(
        left: 4.w,
        right: 4.w,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2.h,
        crossAxisSpacing: 4.w,
        mainAxisExtent: 20.h,
      ),
      children: [
        ChurchTodayContainer(
          primaryColor: primaryColor,
          title: "This weeks highlights",
          imageUrl:
              "https://images.pexels.com/photos/2774546/pexels-photo-2774546.jpeg?auto=compress&cs=tinysrgb&w=600",
          function: () {
            navigateFunction(
              context,
              ChurchHighlightWidget(churchTodayProvider: churchTodayProvider),
            );
          },
        ),
        ChurchTodayContainer(
          primaryColor: primaryColor,
          title: "Watch the latest sermon",
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsUuhYKdM8YsgR9-0azxRCaId4Bt_R1P6jcA&usqp=CAU",
          function: () {
            navigateFunction(
              context,
              LatestSermonWidget(churchTodayProvider: churchTodayProvider),
            );
          },
        ),
        ChurchTodayContainer(
          primaryColor: primaryColor,
          title: "Prayers for the week",
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkYIJr1-SjhbwnIfCn9olFl9Fs2I0ikXFl3A&usqp=CAU",
          function: () {
            navigateFunction(
              context,
              PrayerForWeekWidget(
                churchTodayProvider: churchTodayProvider,
              ),
            );
          },
        ),
        ChurchTodayContainer(
          primaryColor: primaryColor,
          title: "Bible verse of the week",
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJevmZ2Lnp_3QR8GWXz3EX2sTM0zHOhxPwDou6sWRjTpupHcgPgf3aGtb0_1N_5OyOC-o&usqp=CAU",
          function: () {
            showBibleVerseDialog(context);
          },
        ),
        ChurchTodayContainer(
          primaryColor: primaryColor,
          title: "Last sunday choir ministration",
          imageUrl:
              "https://images.pexels.com/photos/7520744/pexels-photo-7520744.jpeg?auto=compress&cs=tinysrgb&w=600",
          function: () {
            navigateFunction(
              context,
              ChoirMinistrationWidget(churchTodayProvider: churchTodayProvider),
            );
          },
        ),
        ChurchTodayContainer(
          primaryColor: primaryColor,
          title: "Bible study outline",
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnOmGlmX5cuUMjuKUciEHFzlMstqxcWNvUfA&usqp=CAU",
          function: () {
            navigateFunction(
              context,
              BibleStudyWidget(churchTodayProvider: churchTodayProvider),
            );
          },
        ),
      ],
    );
  }

  Future<dynamic> navigateFunction(BuildContext context, Widget screen) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => screen,
      ),
    );
  }

  void showBibleVerseDialog(BuildContext context) {
    var churchTodayProvider =
        Provider.of<ChurchTodayProvier>(context, listen: false);

    showDialog(
      context: context,
      builder: (ctx) =>
          BibleVerseDialogWidget(churchTodayProvider: churchTodayProvider),
    );
  }
}
