import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../sermon-list-widget/sermon_list_screen_app_bar.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.searchController,
    required this.searchActive,
    required this.widget,
  });

  final TextEditingController searchController;
  final bool searchActive;
  final SermonPrayerListScreenAppBar widget;

  @override
  Widget build(BuildContext context) {
    // get app theme properties
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    var textTheme2 = of.textTheme;
    var bodyMedium = textTheme2.bodyMedium;

    // custom text field border design
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none,
    );

    return SizedBox(
      height: 5.h,
      width: 80.w,
      child: TextField(
        controller: searchController,
        enabled: searchActive,
        style: bodyMedium,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          hintText: "Search sermon",
          hintStyle:
              bodyMedium?.copyWith(color: Colors.black45, fontSize: 10.sp),
          contentPadding: EdgeInsets.only(
            bottom: 2.h,
            left: 4.w,
          ),
        ),
        onChanged: (value) => widget.function(value),
      ),
    );
  }
}
