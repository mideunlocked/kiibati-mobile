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
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    var homePageProvider = Provider.of<HomePageProvider>(context);

    return StreamBuilder<QuerySnapshot>(
        stream: homePageProvider.getUpcomingService(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return ImageLoadErrorWidget(
              color: primaryColor.withOpacity(0.7),
              widget: const CustomProgressIndicator(),
            );
          } else if (snapshot.hasData == false && snapshot.data == null) {
            return ImageLoadErrorWidget(
              color: primaryColor.withOpacity(0.7),
              widget: const Icon(
                Icons.error,
                color: Colors.white,
              ),
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
              child: Image.network(
                data["imageUrl"] ?? "",
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    // Image is fully loaded
                    return child;
                  } else {
                    // Show a loading indicator while the image is loading
                    return ImageLoadErrorWidget(
                      color: primaryColor.withOpacity(0.7),
                      widget: const CustomProgressIndicator(),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  // Show an error widget if the image fails to load
                  return ImageLoadErrorWidget(
                    color: primaryColor.withOpacity(0.7),
                    widget: const Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
