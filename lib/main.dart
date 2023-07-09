import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
import 'helpers/firebase_messaging.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessagingHelper().setUpPushNotification();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var primaryColor = const Color.fromARGB(255, 46, 0, 102);

    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        // darkTheme: ThemeData.dark().copyWith(
        //   floatingActionButtonTheme: FloatingActionButtonThemeData(
        //     backgroundColor: const Color.fromARGB(255, 73, 73, 73),
        //   ),
        // ),
        theme: ThemeData(
          primaryColor: primaryColor,
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontFamily: "Poppins",
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: primaryColor,
            ),
            titleMedium: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            bodyLarge: TextStyle(
              fontFamily: "Poppins",
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700,
              // fontStyle: FontStyle.italic,
            ),
            bodyMedium: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12.sp,
              color: Colors.black,
            ),
            bodySmall: TextStyle(
              fontFamily: "Poppins",
              fontSize: 8.sp,
              color: Colors.black45,
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
