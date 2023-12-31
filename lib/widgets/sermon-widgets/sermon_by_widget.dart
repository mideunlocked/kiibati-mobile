import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kiibati_mobile/models/pastor.dart';
import 'package:kiibati_mobile/screens/pastor_catalogue_screen.dart';
import 'package:sizer/sizer.dart';

class SermonByWidget extends StatefulWidget {
  const SermonByWidget({
    super.key,
    required this.by,
    this.isList = false,
  });

  final String by;
  final bool isList;

  @override
  State<SermonByWidget> createState() => _SermonByWidgetState();
}

class _SermonByWidgetState extends State<SermonByWidget> {
  String fullName = "";

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore cloudInstance = FirebaseFirestore.instance;
    CollectionReference collection = cloudInstance.collection("pastors");
    var textStyle = TextStyle(
      color: Colors.black38,
      fontStyle: FontStyle.italic,
      fontSize: 12.sp,
    );
    var textStyle2 = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12.sp,
    );
    var by = "By: $fullName";
    var edgeInsets = EdgeInsets.only(bottom: 1.h);

    return FutureBuilder<DocumentSnapshot>(
        future: collection.doc(widget.by).get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Padding(
              padding: edgeInsets,
              child: Text(
                fullName != "" ? by : "Something went wrong",
                style: fullName != "" ? textStyle2 : textStyle,
              ),
            );
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Padding(
              padding: edgeInsets,
              child: Text(
                fullName != "" ? by : "Pastor does not exist",
                style: fullName != "" ? textStyle2 : textStyle,
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: edgeInsets,
              child: Text(
                fullName != "" ? by : "Loading...",
                style: fullName != "" ? textStyle2 : textStyle,
              ),
            );
          }

          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          var title = data["title"] ?? "";
          var name = data["fullName"] ?? "";
          fullName = "$title $name";

          final pastor = Pastor(
            id: data["id"] ?? "",
            title: title,
            position: data["position"] ?? "",
            fullName: fullName,
            imageUrl: data["imageUrl"] ?? "",
            sermons: [],
          );

          return InkWell(
            onTap: () {
              widget.isList
                  ? null
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => PastorCatalogueScreen(
                          pastor: pastor,
                        ),
                      ),
                    );
            },
            child: Padding(
              padding: edgeInsets,
              child: Text(
                widget.isList == true ? fullName : "By: $fullName",
                style: widget.isList == true
                    ? TextStyle(
                        color: Colors.white60,
                        fontSize: 10.sp,
                      )
                    : textStyle2,
              ),
            ),
          );
        });
  }
}
