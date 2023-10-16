import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
import 'helpers/firebaseapi.dart';
import 'providers/auth_proivder.dart';
import 'providers/church_today_provider.dart';
import 'providers/home_page_provider.dart';
import 'providers/memeber_provider.dart';
import 'providers/notification_provider.dart';
import 'providers/pastor_provider.dart';
import 'providers/payment_provider.dart';
import 'providers/prayer_provider.dart';
import 'providers/sermon_provider.dart';
import 'screens/home_screen.dart';
import 'screens/navigation_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotification();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var primaryColor = const Color(0xFF2E0066);

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
          ChangeNotifierProvider(
            create: (context) => PaymentProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => NotificationProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: Colors.grey[300],
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
          navigatorKey: navigatorKey,
          initialRoute: "/",
          routes: {
            HomeScreen.routeName: (ctx) => const HomeScreen(),
            NotificationScreen.routeName: (ctx) => const NotificationScreen(),
          },
        ),
      ),
    );
  }
}
