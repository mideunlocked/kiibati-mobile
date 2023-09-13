import 'package:flutter/material.dart';
import 'package:kiibati_mobile/widgets/general-widgets/custom_progress_indicator.dart';
import 'package:sizer/sizer.dart';

class ShadedImage extends StatelessWidget {
  const ShadedImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,

          colors: [
            Colors.black,
            Colors.transparent,
          ],
          stops: [0.7, 1.0], // Adjust these stops to control the fading effect
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: Image.network(
        imageUrl,
        height: 60.h,
        width: 100.w,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return sizedBox(
            child: const CustomProgressIndicator(),
          );
        },
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return sizedBox(
            child: Image.asset(
              "assets/images/logo.png",
              height: 5.h,
            ),
          );
        },
      ),
    );
  }

  SizedBox sizedBox({required Widget child}) {
    return SizedBox(
      height: 40.h,
      width: 100.w,
      child: Center(child: child),
    );
  }
}
