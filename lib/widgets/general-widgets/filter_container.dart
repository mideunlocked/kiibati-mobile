import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FilterContainer extends StatelessWidget {
  const FilterContainer({
    super.key,
    required this.title,
    required this.id,
    required this.currentFilter,
  });

  final String title;
  final String id;
  final String currentFilter;

  @override
  Widget build(BuildContext context) {
    bool isActive = currentFilter == id;

    var of = Theme.of(context);
    var primaryColor = of.primaryColor;
    return Container(
      height: 3.h,
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
      ),
      margin: EdgeInsets.only(right: 2.w),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: isActive ? primaryColor.withOpacity(0.7) : Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white70 : Colors.black45,
              fontWeight: isActive ? FontWeight.bold : null,
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          isActive
              ? const Icon(
                  Icons.remove_rounded,
                  color: Colors.white,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
