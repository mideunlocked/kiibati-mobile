import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../models/pastor.dart';
import '../../screens/pastor_catalogue_screen.dart';

class PastorTile extends StatelessWidget {
  const PastorTile({
    super.key,
    required this.height,
    required this.width,
    required this.pastor,
  });

  final Pastor pastor;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var bodyLarge = textTheme.bodyLarge;
    var bodyMedium = textTheme.bodyMedium;

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => PastorCatalogueScreen(
            pastor: pastor,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              pastor.imageUrl,
              fit: BoxFit.cover,
              height: height,
              width: width,
            ),
            Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black87,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 4.w,
                bottom: 8.h,
              ),
              child: Text(
                pastor.fullName,
                // softWrap: true,
                // overflow: TextOverflow.ellipsis,
                // maxLines: 1,
                style: bodyLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 4.w,
                bottom: 2.h,
              ),
              child: Text(
                pastor.position,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: bodyMedium?.copyWith(
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
