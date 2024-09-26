import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/core/theming/app_colors.dart';

ThemeData themeDataLight() => ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
      ),
      scaffoldBackgroundColor: AppColors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.grey,
      ),
      textTheme: TextTheme(
        // font size is 48
        displaySmall: GoogleFonts.poppins(color: AppColors.primaryColor),
        // font size is 16
        titleMedium: GoogleFonts.poppins(color: AppColors.grey),
        // font size is 14
        titleSmall: GoogleFonts.poppins(color: AppColors.grey),
      ),
      iconButtonTheme: IconButtonThemeData(
          style:
              ButtonStyle(iconColor: WidgetStatePropertyAll(AppColors.grey))),
    );
