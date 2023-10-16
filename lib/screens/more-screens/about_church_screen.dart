import 'package:flutter/material.dart';
import 'package:kiibati_mobile/widgets/general-widgets/custome_back_button.dart';
import 'package:sizer/sizer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var titleLarge = textTheme.titleLarge;
    var sizedBox = SizedBox(
      height: 4.h,
    );
    var sizedBox1 = SizedBox(
      height: 1.h,
    );
    var primaryColor = of.primaryColor;
    return Scaffold(
      // appBar: const CustomProfileAppBar(
      //   title: "About church",
      // ),
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: primaryColor,
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.transparent,
          //     primaryColor,
          //   ],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   stops: const [
          //     0.1,
          //     1.0,
          //   ],
          // ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 1.h,
              horizontal: 4.w,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      CustomBackButton(
                        iconColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 22.h,
                    width: 50.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "The mission",
                    style: titleLarge?.copyWith(color: Colors.white),
                  ),
                  sizedBox1,
                  const Text(
                    "The Mission of the Christ Message Ministry is to preach the Gospel of our Lord Jesus Christ for the principal purpose of soul winning; to plant churches and establish gospel institutions; to build and nurture happy Christian families and mature Christians who know, appreciate and depend absolutely on the unfailing Power of God.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  sizedBox,
                  Text(
                    "Motto",
                    style: titleLarge?.copyWith(color: Colors.white),
                  ),
                  sizedBox1,
                  const Text(
                    "We Preach the Gospel of Christ to the Glory of God",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  sizedBox,
                  Text(
                    "Anthem",
                    style: titleLarge?.copyWith(color: Colors.white),
                  ),
                  sizedBox1,
                  const Text(
                    "The wordings of the Christ Message Ministry Anthem (with significance of joining hands together while singing)are: “One Body, One Saviour, One Word, Christ the Leader (3x)”",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  sizedBox,
                  Text(
                    "Founder",
                    style: titleLarge?.copyWith(color: Colors.white),
                  ),
                  sizedBox1,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/kiibati-3ea86.appspot.com/o/pastors%2Fbishop.jpeg?alt=media&token=5c9d371c-573e-497d-90dd-870824f16ca0",
                      height: 30.h,
                      width: 65.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  sizedBox1,
                  const Text(
                    "Bola Odeleke (born 1950) is a Nigerian pastor, evangelist, preacher, founder and general overseer of Power Pentecostal Church.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  sizedBox,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
