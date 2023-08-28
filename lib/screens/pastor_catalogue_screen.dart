import 'package:flutter/material.dart';
import 'package:kiibati_mobile/models/pastor.dart';
import 'package:kiibati_mobile/widgets/general-widgets/custome_back_button.dart';
import 'package:sizer/sizer.dart';

class PastorCatalogueScreen extends StatelessWidget {
  const PastorCatalogueScreen({super.key, required this.pastor});

  final Pastor pastor;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var titleLarge = textTheme.titleLarge;
    var bodyMedium = textTheme.bodyMedium;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [
                  0.7,
                  1.0
                ], // Adjust these stops to control the fading effect
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              pastor.imageUrl,
              height: 50.h,
              width: 100.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            pastor.fullName,
            style: titleLarge,
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(
            pastor.position,
            style: bodyMedium,
          ),
        ],
      ),
    );
  }
}
