import 'package:flutter/material.dart';
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
      child: Image.asset(
        imageUrl,
        height: 50.h,
        width: 100.w,
        fit: BoxFit.cover,
      ),
    );
  }
}
