import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../general-widgets/custom_progress_indicator.dart';

class VideoLoadingIndicator extends StatelessWidget {
  const VideoLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 12.h,
      child: const CustomProgressIndicator(),
    );
  }
}
