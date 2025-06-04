import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF3B6BFD);
  static const Color background = Color(0xFFFFFFFF);
  static const Color text = Colors.black;
  static const Color gray = Color(0xFF9E9E9E); // Abu-abu netral
  static const Color blueSoft = Color(0xFFEAF4FF);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.primary),
        titleTextStyle: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      useMaterial3: true,
    );
  }
}

/// Custom text styles
TextStyle whiteTextStyle = GoogleFonts.poppins(color: Colors.white);
TextStyle greyTextStyle = GoogleFonts.poppins(color: AppColors.gray);
TextStyle blackTextStyle = GoogleFonts.poppins(color: Colors.black);
TextStyle primaryTextStyle = GoogleFonts.poppins(color: AppColors.primary);
