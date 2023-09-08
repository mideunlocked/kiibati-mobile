import 'package:flutter/material.dart';
import 'package:kiibati_mobile/widgets/general-widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class LicensesScreen extends StatelessWidget {
  const LicensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var primaryColor = of.primaryColor;
    var bodyLarge = textTheme.bodyLarge;
    var textStyle = const TextStyle(
      color: Colors.white38,
    );

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: 90,
              height: 90,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            "Kiibati Mobile",
            style: bodyLarge?.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 25.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "Version 1.2.1",
            style: textStyle,
          ),
          Text(
            "© 2023 Stact Platforms Inc.",
            style: textStyle,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 4.h,
              horizontal: 8.w,
            ),
            child: CustomButton(
              color: Colors.white38,
              label: "Licenses",
              function: () => showAboutDialog(
                context: context,
                applicationName: "Kiibati Mobile",
                applicationIcon: Image.asset(
                  "assets/images/logo.png",
                  width: 40,
                  height: 40,
                ),
                applicationVersion: "1.0.0",
                applicationLegalese:
                    "Before diving into the licenses for the resources used in the app, it's important to emphasize the significance of respecting intellectual property rights and adhering to licensing requirements. The app serves as a functional software application, providing users with a seamless and engaging experience. Throughout the development process, careful consideration has been given to ensure compliance with relevant licenses and permissions. This includes using open-source frameworks like Flutter itself, along with legally obtained images, graphics, icons, fonts, and third-party libraries. By upholding licensing obligations, we demonstrate our commitment to ethical practices and acknowledge the value of the creative works that contribute to the app's functionality and visual appeal.",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
