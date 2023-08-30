import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../screens/auth-screens/forgot_password_screen.dart';

class ForgotPasswordTextWidget extends StatelessWidget {
  const ForgotPasswordTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var bodyMedium = textTheme.bodyMedium;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const ForgotPassword(),
              ),
            );
          },
          child: Text(
            "Forgot Password?",
            style: bodyMedium?.copyWith(
              fontSize: 10.sp,
            ),
          ),
        ),
      ],
    );
  }
}
