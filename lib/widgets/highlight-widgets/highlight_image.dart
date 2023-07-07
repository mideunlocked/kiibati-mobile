import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'highlight_controller.dart';

class HighlightImage extends StatelessWidget {
  const HighlightImage({
    super.key,
    required this.pageController,
    required this.image,
  });

  final PageController pageController;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Image.network(
          image,
          height: 100.h,
          width: 100.w,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;

            return ImageCircularProgressIndicator(
                loadingProgress: loadingProgress);
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_rounded,
                    color: Colors.red,
                    size: 5.h,
                  ),
                  Text(
                    "An error occured while trying to load highlight",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.red, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            );
          },
        ),
        HighlightController(pageController: pageController),
      ],
    );
  }
}

class ImageCircularProgressIndicator extends StatelessWidget {
  const ImageCircularProgressIndicator({
    super.key,
    required this.loadingProgress,
  });

  final ImageChunkEvent loadingProgress;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 1,
        color: primaryColor,
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  }
}
