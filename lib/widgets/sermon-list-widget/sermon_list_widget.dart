import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/date_time_formatting.dart';
import '../../screens/sermon_screen.dart';
import 'sermon_detail_widget.dart';

class SermonListWidget extends StatelessWidget {
  const SermonListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var primaryColor = of.primaryColor;
    var dateTimeFormatting = DateTimeFormatting();
    var dateTime = dateTimeFormatting.formatTimeDate(Timestamp.now());
    var sizedBox = SizedBox(
      height: 0.5.h,
    );

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => const SermonScreen(),
        ),
      ),
      child: Container(
        height: 15.h,
        width: 100.w,
        margin: EdgeInsets.only(
          bottom: 1.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              primaryColor,
              primaryColor.withOpacity(0.5),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // sermon display image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsUuhYKdM8YsgR9-0azxRCaId4Bt_R1P6jcA&usqp=CAU",
                  height: 12.h,
                  width: 30.w,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                        color: Colors.grey,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Center(
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 5.h,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: 3.w,
            ),

            // sermon detail widget
            SermonDetailWidget(
                textTheme: textTheme, sizedBox: sizedBox, dateTime: dateTime),

            // download icon button
            Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child: const Icon(
                Icons.arrow_circle_down_rounded,
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
