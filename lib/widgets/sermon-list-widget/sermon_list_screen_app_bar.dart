import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../general-widgets/search_text_field.dart';

class SermonPrayerListScreenAppBar extends StatefulWidget {
  const SermonPrayerListScreenAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.function,
  });

  final String title, subtitle;
  final Function(String) function;

  @override
  State<SermonPrayerListScreenAppBar> createState() =>
      _SermonPrayerListScreenAppBarState();
}

class _SermonPrayerListScreenAppBarState
    extends State<SermonPrayerListScreenAppBar> {
  bool searchActive = false;

  final searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var primaryColor = of.primaryColor;

    bool isSearch = searchActive == true;

    return SizedBox(
      width: 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 80.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                    fontSize: 16.sp,
                  ),
                ),
                isSearch
                    ? SearchTextField(
                        searchController: searchController,
                        searchActive: searchActive,
                        widget: widget,
                      )
                    : Text(
                        widget.subtitle,
                        style: textTheme.bodySmall,
                      )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 3.w, bottom: 1.h),
            child: InkWell(
              onTap: () {
                setState(() {
                  searchActive = !searchActive;
                });
                if (searchActive == false) {
                  searchController.clear();
                  widget.function("");
                }
              },
              borderRadius: BorderRadius.circular(20),
              child: customIcons(
                primaryColor,
                isSearch ? "close" : "search",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Image customIcons(Color primaryColor, String iconUrl) {
    return Image.asset(
      "assets/icons/$iconUrl.png",
      height: 2.5.h,
      width: iconUrl == "close" ? 3.w : null,
      color: primaryColor,
    );
  }
}
