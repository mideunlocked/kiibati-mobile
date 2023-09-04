import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../models/pastor.dart';
import '../../providers/pastor_provider.dart';
import '../../widgets/general-widgets/custom_progress_indicator.dart';
import '../../widgets/more-widgets/custom_profile_appbar.dart';
import '../../widgets/pastor-widgets/pastor_tile.dart';

class PastorsScreen extends StatelessWidget {
  const PastorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pastorProvider = Provider.of<PastorProvider>(context, listen: false);

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
              StreamBuilder<QuerySnapshot>(
                  stream: pastorProvider.getBishop(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return sizedBox(
                        const Text('Something went wrong'),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return sizedBox(
                        const CustomProgressIndicator(),
                      );
                    } else if (snapshot.hasData == false &&
                        snapshot.data == null) {
                      return sizedBox(
                        const Icon(Icons.error_rounded, color: Colors.white),
                      );
                    }

                    Map<String, dynamic> bishopData = snapshot.data?.docs.first
                        .data() as Map<String, dynamic>;

                    return PastorTile(
                      height: 40.h,
                      width: 100.w,
                      pastor: Pastor(
                        id: bishopData["id"] ?? "",
                        title: bishopData["title"] ?? "",
                        fullName: bishopData["fullName"] ?? "",
                        position: bishopData["position"] ?? "",
                        imageUrl: bishopData["imageUrl"] ?? "",
                        sermons: bishopData["sermons"] ?? [],
                      ),
                    );
                  }),
              SizedBox(
                height: 2.h,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: pastorProvider.getPastors(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return sizedBox(
                        const Text('Something went wrong'),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return sizedBox(
                        const CustomProgressIndicator(),
                      );
                    } else if (snapshot.hasData == false &&
                        snapshot.data == null) {
                      return sizedBox(
                        const Icon(Icons.error_rounded, color: Colors.white),
                      );
                    }

                    return GridView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2.h,
                        crossAxisSpacing: 4.w,
                        mainAxisExtent: 30.h,
                      ),
                      children: snapshot.data?.docs
                              .skip(1)
                              .map(
                                (DocumentSnapshot prayer) => PastorTile(
                                  height: 40.h,
                                  width: 100.w,
                                  pastor: Pastor(
                                    id: prayer["id"] ?? "",
                                    title: prayer["title"] ?? "",
                                    position: prayer["position"] ?? "",
                                    fullName: prayer["fullName"] ?? "",
                                    imageUrl: prayer["imageUrl"] ?? "",
                                    sermons: prayer["sermons"] ?? [],
                                  ),
                                ),
                              )
                              .toList() ??
                          [],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget sizedBox(Widget widget) {
    return SizedBox(
      height: 40.h,
      width: 100.w,
      child: Center(
        child: widget,
      ),
    );
  }
}
