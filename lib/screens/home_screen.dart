import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';

import '../widgets/bottom-nav-widgets/custom_bottom_nav.dart';
import 'bottom-nav-screens/home_page.dart';
import 'bottom-nav-screens/more_screen.dart';
import 'bottom-nav-screens/sermon_list_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final pageController = PageController(
    initialPage: 0,
  );

  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();

    pageController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var pages = [
      HomePage(
        scrollController: scrollController,
      ),
      SermonListScreen(
        scrollController: scrollController,
      ),
      // PrayerListScreen(
      //   scrollController: scrollController,
      // ),
      MoreScreen(
        scrollController: scrollController,
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            AnimatedBuilder(
              animation: scrollController,
              builder: (context, child) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: scrollController.hasClients &&
                          scrollController.position.userScrollDirection ==
                              ScrollDirection.reverse
                      ? 0
                      : 10.h,
                  child: child,
                );
              },
              child: CustomBottomNav(
                pageController: pageController,
                currentIndex: currentIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
