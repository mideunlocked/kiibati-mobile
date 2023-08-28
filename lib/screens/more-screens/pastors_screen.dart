import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../models/pastor.dart';
import '../../widgets/more-widgets/custom_profile_appbar.dart';
import '../../widgets/pastor-widgets/pastor_tile.dart';

class PastorsScreen extends StatelessWidget {
  const PastorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomProfileAppBar(
        title: "Pastors",
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 1.h,
          left: 5.w,
          right: 5.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PastorTile(
                height: 40.h,
                width: 100.w,
                pastor: const Pastor(
                  id: "0",
                  fullName: "Bishop Bolanle Odeleke",
                  position:
                      "Founder and General overseer of Power Pentecostal Church",
                  imageUrl: "assets/images/bishop.jpg",
                  sermons: [],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2.h,
                  crossAxisSpacing: 4.w,
                  mainAxisExtent: 30.h,
                ),
                children: [
                  PastorTile(
                    height: 40.h,
                    width: 100.w,
                    pastor: const Pastor(
                      id: "1",
                      fullName: "Pastor Paul Osuolale",
                      position:
                          "Superitendent Okota District / Resident Pastor Okota branch.",
                      sermons: [],
                      imageUrl: "assets/images/paul.jpeg",
                    ),
                  ),
                  PastorTile(
                    height: 40.h,
                    width: 100.w,
                    pastor: const Pastor(
                      id: "2",
                      fullName: "Pastor Sanmi Odujoko",
                      position: "Pastor Okota branch.",
                      imageUrl: "assets/images/sanmi.jpeg",
                      sermons: [],
                    ),
                  ),
                  PastorTile(
                    height: 40.h,
                    width: 100.w,
                    pastor: const Pastor(
                      id: "3",
                      fullName: "Pastor Paul Osuolale",
                      position:
                          "Superitendent Okota and Okonkwo Branch / Resident Pastor Okota branch.",
                      sermons: [],
                      imageUrl: "assets/images/paul.jpeg",
                    ),
                  ),
                  PastorTile(
                    height: 40.h,
                    width: 100.w,
                    pastor: const Pastor(
                      id: "4",
                      fullName: "Pastor Sanmi Odujoko",
                      position: "Pastor Okota branch.",
                      imageUrl: "assets/images/sanmi.jpeg",
                      sermons: [],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
