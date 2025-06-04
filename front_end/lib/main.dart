import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'utils/theme.dart';

// import semua halaman
import 'views/onboarding/splash_screen.dart';
import 'views/home/home_page.dart';
import 'views/chat/chat_page.dart';
import 'views/history/riwayat_page.dart';
import 'views/profile/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins', // font Poppins dari GoogleFonts
            scaffoldBackgroundColor: Colors.white,
          ),
          home: SplashScreen(),
          routes: {
            '/home': (context) => const HomePage(),
            '/chat': (context) => const ChatPage(),
            '/riwayat': (context) => const RiwayatPage(),
            '/profil': (context) => const ProfilePage(),
          },
        );
      },
    );
  }
}
