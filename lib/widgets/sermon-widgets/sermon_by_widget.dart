import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SermonByWidget extends StatelessWidget {
  const SermonByWidget({
    super.key,
    required this.by,
    this.isList = false,
  });

  final String by;
  final bool isList;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore cloudInstance = FirebaseFirestore.instance;
    CollectionReference collection = cloudInstance.collection("pastors");

    return FutureBuilder<DocumentSnapshot>(
        future: collection.doc(by).get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text(
              "Something went wrong",
              style: TextStyle(
                color: Colors.black38,
                fontStyle: FontStyle.italic,
              ),
            );
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text(
              "Pastor does not exist",
              style: TextStyle(
                color: Colors.black38,
                fontStyle: FontStyle.italic,
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text(
              "Loading...",
              style: TextStyle(
                color: Colors.black38,
                fontStyle: FontStyle.italic,
              ),
            );
          }

          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          var title = data["title"] ?? "";
          var fullName = data["fullName"] ?? "";

          return Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Text(
              isList == true ? "$title $fullName" : "By: $title $fullName",
              style: isList == true
                  ? TextStyle(
                      color: Colors.white60,
                      fontSize: 10.sp,
                    )
                  : TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
            ),
          );
        });
  }
}
