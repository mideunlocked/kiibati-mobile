import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
import 'helpers/firebase_messaging.dart';
import 'screens/sermon_screen.dart';

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
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color.fromARGB(255, 46, 0, 102),
            textTheme: TextTheme(
              titleLarge: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(255, 46, 0, 102),
              ),
              bodyLarge: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16.sp,
                color: const Color.fromARGB(255, 46, 0, 102),
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
              bodyMedium: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12.sp,
                color: Colors.black,
              ),
              bodySmall: TextStyle(
                fontFamily: "Poppins",
                fontSize: 8.sp,
                color: Colors.black,
              ),
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color.fromARGB(255, 46, 0, 102),
            )),
        home: const HomeScreen(),
      ),
    );
  }
}
