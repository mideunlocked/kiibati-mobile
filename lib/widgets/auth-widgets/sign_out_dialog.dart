import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOutDialog extends StatelessWidget {
  const SignOutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Time to leave?"),
      content: const Text(
          "Simply tap the 'Sign Out' button below to gracefully exit and end your session."),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            "Cancel",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            try {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
              Navigator.pop(context);
            } catch (e) {
              print(e);
            }
          },
          child: const Text(
            "Sign out",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
