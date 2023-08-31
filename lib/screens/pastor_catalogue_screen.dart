import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../models/pastor.dart';
import '../widgets/general-widgets/conatined_back_button.dart';
import '../widgets/general-widgets/shaded_image.dart';
// import '../widgets/sermon-list-widget/sermon_list_widget.dart';

class PastorCatalogueScreen extends StatelessWidget {
  const PastorCatalogueScreen({super.key, required this.pastor});

  final Pastor pastor;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var titleLarge = textTheme.titleLarge;
    var bodyMedium = textTheme.bodyMedium;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadedImage(imageUrl: pastor.imageUrl),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pastor.fullName,
                        style: titleLarge,
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        pastor.position,
                        style: bodyMedium,
                      ),
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          // const SermonListWidget(),
                          // const SermonListWidget(),
                          // const SermonListWidget(),
                          // const SermonListWidget(),
                          // const SermonListWidget(),
                          // const SermonListWidget(),
                          // const SermonListWidget(),
                          // const SermonListWidget(),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const ContainedBackButton(),
        ],
      ),
    );
  }
}
