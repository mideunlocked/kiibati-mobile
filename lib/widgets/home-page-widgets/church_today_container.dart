import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChurchTodayContainer extends StatelessWidget {
  const ChurchTodayContainer({
    super.key,
    required this.primaryColor,
    required this.title,
    this.imageUrl = "",
    required this.function,
  });

  final Color primaryColor;
  final String title;
  final String imageUrl;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
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
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                            color: Colors.grey,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Center(
                          child: Image.asset(
                            "assets/images/logo.png",
                            height: 5.h,
                          ),
                        );
                      },
                    ),
                  ),

            // container title
            Container(
              width: 100.w,
              height: 5.5.h,
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
                vertical: 0.5.h,
              ),
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
      ),
    );
  }
}
