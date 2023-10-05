import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kiibati_mobile/widgets/general-widgets/custom_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../providers/home_page_provider.dart';
import 'exhortation_dialog.dart';

class ExhortationContainer extends StatelessWidget {
  const ExhortationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;
    var homePageProvider = Provider.of<HomePageProvider>(context);

    return StreamBuilder<QuerySnapshot>(
        stream: homePageProvider.getExhortation(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return thirdContainer(
              primaryColor,
              const CustomProgressIndicator(),
            );
          } else if (snapshot.hasData == false && snapshot.data == null) {
            return thirdContainer(primaryColor,
                const Icon(Icons.error_rounded, color: Colors.white));
          }

          Map<String, dynamic> data =
              snapshot.data?.docs.first.data()! as Map<String, dynamic>;
          var title = data["title"] ?? "";
          var verse = data["verse"] ?? "";
          var body = data["body"] ?? "";
          var reference = data["reference"] ?? "";

          return InkWell(
            onTap: () => showExhortationDialog(
              context,
              title,
              verse,
              body,
              reference,
            ), // show exhortation dialog
            child: Container(
              height: 35.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              margin: EdgeInsets.only(
                left: 4.w,
                right: 4.w,
              ),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // exhortation title
                    Text(
                      "Title: $title",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),

                    // exhortation bible reference
                    Text(
                      "Verse: $reference",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),

                    // exhortation text
                    Text(
                      body,
                      maxLines: 5,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Container thirdContainer(Color primaryColor, Widget widget) {
    return Container(
      height: 35.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(
        left: 4.w,
        right: 4.w,
      ),
      alignment: Alignment.center,
      child: widget,
    );
  }

  // function to exhortation dialog
  void showExhortationDialog(BuildContext context, String title, String verse,
      String body, String reference) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return ExhortationDialog(
          title: title,
          verse: verse,
          body: body,
          reference: reference,
        );
      },
    );
  }
}
