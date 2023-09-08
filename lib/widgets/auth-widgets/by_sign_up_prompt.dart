import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kiibati_mobile/helpers/app_links.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class BySignUpPrompt extends StatelessWidget {
  const BySignUpPrompt({
    super.key,
    required this.primaryColor,
  });

  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text:
            'By signing up, you agree to our ', // Default style for the entire text
        style: TextStyle(
          color: Colors.black26,
          fontSize: 9.sp,
        ), // Default text style
        children: <TextSpan>[
          TextSpan(
            text: ' ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          linkedTextSpan(
            text: "Terms ",
            link: terms_and_contition,
          ),
          const TextSpan(
            text: "and",
          ),
          linkedTextSpan(
            text: " Privacy Policy",
            link: privacy_policy,
          ),
        ],
      ),
    );
  }

  TextSpan linkedTextSpan({
    required String link,
    required String text,
  }) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () async {
          final url = Uri.parse(link);
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          } else {
            throw "Could not launch $url";
          }
        },
    );
  }
}
