import 'package:flutter/material.dart';
import 'package:kiibati_mobile/widgets/general-widgets/custom_button.dart';
import 'package:kiibati_mobile/widgets/more-widgets/custom_profile_appbar.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class FindChurchScreen extends StatelessWidget {
  const FindChurchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;
    var sizedBox = SizedBox(
      height: 5.h,
    );
    return Scaffold(
      appBar: const CustomProfileAppBar(
        title: "Find church",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/icons/location.png",
                  height: 30.h,
                  width: 60.w,
                  color: primaryColor,
                ),
              ),
              sizedBox,
              const Text(
                "Power Pentecostal Church, Okota Road, Lagos",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "174/178 Okota road, Lagos",
                textAlign: TextAlign.center,
              ),
              sizedBox,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                ),
                child: CustomButton(
                  color: primaryColor,
                  label: "Locate",
                  function: () => navigateToMap(),
                ),
              ),
              sizedBox,
              sizedBox,
              const Text(
                "For more enquiries contact Pastor Paul 08033529095",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> navigateToMap() async {
    String latitude = "6.508294033207267";
    String longitude = "3.3216814520210534";
    String mapUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude"; // 6.5080591552034335, 3.320699515341309
    Uri url = Uri.parse(mapUrl);
    bool canLaunchMap = await canLaunchUrl(url);

    if (canLaunchMap) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $mapUrl';
    }
  }
}
