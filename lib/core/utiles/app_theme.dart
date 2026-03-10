import 'package:flutter/material.dart';
import 'package:islamic/core/utiles/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme=ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackyColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor
      ),
    )

  );
}