import 'package:flutter/material.dart';
import 'package:kiibati_mobile/widgets/general-widgets/custom_progress_indicator.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.color,
    required this.label,
    this.isLoading = false,
    required this.function,
  });

  final Color color;
  final String label;
  final bool isLoading;
  final Function function;

  @override
  Widget build(BuildContext context) {
    bool isWhite = color == Colors.transparent;

    return InkWell(
      onTap: () {
        function(); // button function
      },
      child: Container(
        height: 7.h,
        width: 100.w,
        margin: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: isLoading == true
            ? const CustomProgressIndicator()
            : Text(
                label,
                style: TextStyle(
                  color: isWhite ? null : Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }
}
