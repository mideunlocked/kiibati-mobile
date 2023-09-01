import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kiibati_mobile/models/member.dart';
import 'package:sizer/sizer.dart';

import '../../providers/memeber_provider.dart';
import '../../screens/auth-screens/login_screen.dart';
import '../../screens/more-screens/profile_screen.dart';
import 'more_icon.dart';
import 'more_list_tile.dart';
import 'name_container.dart';

class AuthCheckWidget extends StatelessWidget {
  const AuthCheckWidget({
    super.key,
    required this.memberProvider,
  });

  final MemberProvider memberProvider;

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: Colors.black38,
      fontStyle: FontStyle.italic,
      fontSize: 10.sp,
    );

    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData == false) {
          return const MoreListTile(
            title: "Sign In or Sign Up",
            widget: MoreIcon(
              iconUrl: "user",
            ),
            page: SignInScreen(),
          );
        } else {
          return StreamBuilder<QuerySnapshot>(
              stream: memberProvider.getUserDetails(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'Something went wrong',
                    style: textStyle,
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                      child: Text(
                    "Loading...",
                    style: textStyle,
                  ));
                } else if (snapshot.hasData == false && snapshot.data == null) {
                  return Text(
                    "xxxxxx",
                    style: textStyle,
                  );
                }

                Map<String, dynamic> data =
                    snapshot.data?.docs.first.data()! as Map<String, dynamic>;
                var fullName = "${data["firstName"]} ${data["lastName"]}";

                return MoreListTile(
                  title: fullName,
                  widget: NameContainer(fullName: fullName),
                  page: ProfileScreen(
                    member: Member(
                      "",
                      id: data["id"] ?? "",
                      firstName: data["firstName"] ?? "",
                      lastName: data["lastName"] ?? "",
                      mobileNumber: data["mobileNumber"] ?? "",
                      emailAddress: data["email"] ?? "",
                      age: 0,
                      maritalStatus: data["maritalStatus"] ?? "",
                      profession: data["profession"] ?? "",
                      dateOfBirth: data["dateOfBirth"] ?? "",
                    ),
                  ),
                );
              });
        }
      },
    );
  }
}
