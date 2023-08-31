import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../providers/home_page_provider.dart';
import 'announcement_container.dart';

class AnnouncemenstsWidget extends StatelessWidget {
  const AnnouncemenstsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var homePageProvider = Provider.of<HomePageProvider>(context);
    const annoucementContainer = AnnoucementContainer(
      title: "xxxxxxxx",
      subtitle:
          "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
      timeDate: "xxxxxxxx",
    );

    return StreamBuilder<QuerySnapshot>(
        stream: homePageProvider.getAnnouncement(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return annoucementContainer;
          } else if (snapshot.hasData == false && snapshot.data == null) {
            return annoucementContainer;
          }

          return SizedBox(
            height: 35.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  SizedBox(
                    width: 4.w,
                  ),
                  Row(
                    children: snapshot.data?.docs
                            .map(
                              (DocumentSnapshot announcement) =>
                                  AnnoucementContainer(
                                title: announcement["title"] ?? "",
                                subtitle: announcement["body"] ?? "",
                                timeDate: announcement["date-time"] ?? "",
                              ),
                            )
                            .toList() ??
                        [],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
