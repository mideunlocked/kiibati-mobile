import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
import 'helpers/firebase_messaging.dart';
import 'providers/auth_proivder.dart';
import 'providers/church_today_provider.dart';
import 'providers/home_page_provider.dart';
import 'providers/memeber_provider.dart';
import 'providers/pastor_provider.dart';
import 'providers/prayer_provider.dart';
import 'providers/sermon_provider.dart';
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
      builder: (context, orientation, deviceType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomePageProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ChurchTodayProvier(),
          ),
          ChangeNotifierProvider(
            create: (context) => SermonProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PrayerProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => MemberProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PastorProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: primaryColor,
            appBarTheme: AppBarTheme(
              elevation: 0,
              color: Colors.transparent,
              titleTextStyle: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12.sp,
                color: Colors.black,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                color: Colors.black26,
                fontSize: 12.sp,
                fontFamily: "PlusJakartaSans",
              ),
              labelStyle: TextStyle(
                color: Colors.black26,
                fontSize: 12.sp,
                fontFamily: "PlusJakartaSans",
              ),
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              focusedBorder: const UnderlineInputBorder(),
            ),
            textTheme: TextTheme(
              titleLarge: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: primaryColor,
              ),
              titleMedium: TextStyle(
                fontFamily: "Poppins",
                fontSize: 10.sp,
                color: Colors.black,
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
      ),
    );
  }
}
