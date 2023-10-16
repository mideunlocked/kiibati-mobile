import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/filter_queries.dart';
import '../../models/sermon.dart';
import '../../providers/sermon_provider.dart';
import '../../widgets/general-widgets/custom_progress_indicator.dart';
import '../../widgets/general-widgets/empty_sermon_list_widget.dart';
import '../../widgets/general-widgets/filter_container.dart';
import '../../widgets/sermon-list-widget/sermon_list_screen_app_bar.dart';
import '../../widgets/sermon-list-widget/sermon_list_widget.dart';

class SermonListScreen extends StatefulWidget {
  const SermonListScreen({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<SermonListScreen> createState() => _SermonListScreenState();
}

class _SermonListScreenState extends State<SermonListScreen> {
  // holds the filter id
  String filterId = "0";
  // holds search text
  String searchText = "";

  // gets the search text from the child widget (searmon prayer app bar)
  void getSearchText(String newSearch) {
    setState(() {
      searchText = newSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    // custom height ssizedbox
    var sizedBox = SizedBox(
      height: 2.h,
    );

    // sermon provider
    var sermonProvider = Provider.of<SermonProvider>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/",
          (route) => false,
        );
        throw 0;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          sizedBox,

          // sermons app bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: SermonPrayerListScreenAppBar(
              title: "Sermons",
              subtitle:
                  "Deepen your spiritual journey and gain fresh insights into God's Word through our enriching sermons.",
              function: getSearchText,
            ),
          ),

          // some space
          sizedBox,

          // filter list view
          SizedBox(
            height: 3.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: FilterQueries.sermonFilterQueries
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        setState(() {
                          if (filterId != e.id || filterId == "0") {
                            filterId = e.id;
                          } else {
                            filterId = "0";
                          }
                        });
                      },

                      // custom filter container
                      child: FilterContainer(
                        title: e.title,
                        id: e.id,
                        currentFilter: filterId,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),

          // some spacing
          SizedBox(
            height: 2.h,
          ),

          // sermons list view
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: sermonProvider.getSermons(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CustomProgressIndicator());
                  } else if (snapshot.hasData == false &&
                      snapshot.data == null) {
                    return const Icon(Icons.error_rounded, color: Colors.white);
                  }

                  return ListView(
                    controller: widget.scrollController,
                    physics: const BouncingScrollPhysics(),
                    children: snapshot.data!.docs
                            // filter queries
                            .where((e) {
                      if (filterId != "0") {
                        return e["serviceType"] == filterId;
                      }
                      return true;
                    }).isNotEmpty
                        ?

                        // search queries
                        snapshot.data?.docs
                                .where((e) {
                                  if (filterId != "0") {
                                    return e["serviceType"] == filterId;
                                  }
                                  return true;
                                })
                                .where(
                                  (e) => e["title"]
                                      .toString()
                                      .toLowerCase()
                                      .contains(
                                        searchText.toLowerCase(),
                                      ),
                                )
                                .map(
                                  (DocumentSnapshot sermon) => SermonListWidget(
                                    sermon: Sermon(
                                      id: sermon["id"] ?? "",
                                      by: sermon["by"] ?? "",
                                      title: sermon["title"] ?? "",
                                      imageUrl: sermon["imageUrl"] ?? "",
                                      category: sermon["category"] ?? "",
                                      videoLink: sermon["videoLink"] ?? "",
                                      audioLink: sermon["audioLink"] ?? "",
                                      sermonText: sermon["sermonText"] ?? [],
                                      serviceType: sermon["serviceType"] ?? "",
                                      isDownloaded:
                                          sermon["isDownloaded"] ?? false,
                                      scripturalReference:
                                          sermon["reference"] ?? "",
                                      timestamp: sermon["timestamp"] ??
                                          Timestamp.now(),
                                    ),
                                  ),
                                )
                                .toList() ??
                            []
                        : [
                            const EmptySermonList(),
                          ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
