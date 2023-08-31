import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../providers/home_page_provider.dart';
import '../general-widgets/custom_progress_indicator.dart';
import 'image_load_error_widget.dart';

class UpcomingServiceWidget extends StatelessWidget {
  const UpcomingServiceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var homePageProvider = Provider.of<HomePageProvider>(context);

    return StreamBuilder<QuerySnapshot>(
        stream: homePageProvider.getUpcomingService(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const ImageLoadErrorWidget(
              widget: CustomProgressIndicator(
                backgroundColor: Colors.transparent,
                color: Colors.white,
              ),
            );
          } else if (snapshot.hasData == false && snapshot.data == null) {
            return const ImageLoadErrorWidget(
              widget: Icon(Icons.error),
            );
          }

          Map<String, dynamic> data =
              snapshot.data?.docs.first.data() as Map<String, dynamic>;

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: data["imageUrl"] ?? "",
                placeholder: (context, url) => const ImageLoadErrorWidget(
                  widget: CustomProgressIndicator(
                    backgroundColor: Colors.transparent,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    const ImageLoadErrorWidget(
                  widget: Icon(Icons.error),
                ),
                cacheKey: 'upcoming-service',
              ),
            ),
          );
        });
  }
}
