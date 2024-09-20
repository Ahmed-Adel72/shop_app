import 'package:flutter/material.dart';
import 'package:shop_app/core/theming/app_colors.dart';

ThemeData themeDataDark() => ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
      ),
      scaffoldBackgroundColor: AppColors.black,
      textTheme: const TextTheme(),
    );
