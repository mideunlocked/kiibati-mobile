import 'package:flutter/material.dart';
import 'package:kiibati_mobile/widgets/bottom-nav-widgets/custom_bottom_nav.dart';

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
    Center(
      child: Text("Home Screen"),
    ),
    Center(
      child: Text("Sermons screen"),
    ),
    Center(
      child: Text("Prayer screen"),
    ),
    Center(
      child: Text("More"),
    ),
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
