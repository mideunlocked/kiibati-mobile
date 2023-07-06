import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChurchTodayContainer extends StatelessWidget {
  const ChurchTodayContainer({
    super.key,
    required this.primaryColor,
    required this.title,
    this.imageUrl = "",
  });

  final Color primaryColor;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // check if a image url is passed to the widget
          imageUrl == ""
              ? const SizedBox() // if no url is passed else
              : ClipRRect(
                  // show image
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),

          // container title
          Container(
            width: 100.w,
            height: 10.w,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
