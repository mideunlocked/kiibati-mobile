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
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
      ),
      margin: EdgeInsets.only(right: 3.w, left: id == "0" ? 3.w : 0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: isActive ? primaryColor.withOpacity(0.7) : Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white70 : Colors.black45,
          fontWeight: isActive ? FontWeight.bold : null,
        ),
      ),
    );
  }
}
