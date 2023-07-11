import 'package:flutter/material.dart';
import 'package:kiibati_mobile/screens/bottom-nav-screens/prayers_list_screen.dart';
import 'package:kiibati_mobile/screens/bottom-nav-screens/more_screen.dart';

import '../widgets/bottom-nav-widgets/custom_bottom_nav.dart';
import 'bottom-nav-screens/home_page.dart';
import 'bottom-nav-screens/sermon_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final pageController = PageController(
    initialPage: 0,
  );

  var pages = const [
    HomePage(),
    SermonListScreen(),
    PrayerListScreen(),
    MoreScreen(),
  ];

  @override
  void dispose() {
    super.dispose();

    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // home screen pages with page view
            PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: pages,
              onPageChanged: (index) => setState(() {
                currentIndex = index;
              }),
            ),

            // custom bottom nav
            CustomBottomNav(
              pageController: pageController,
              currentIndex: currentIndex,
            ),
          ],
        ),
      ),
    );
  }
}
