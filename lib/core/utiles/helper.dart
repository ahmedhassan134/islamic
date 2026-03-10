
  import 'package:flutter/material.dart';
import 'package:islamic/core/utiles/app_colors.dart';

  class Helper {
  static late MediaQueryData _mediaQuery;
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
  _mediaQuery = MediaQuery.of(context);
  screenWidth = _mediaQuery.size.width;
  screenHeight = _mediaQuery.size.height;
  }

  static final TextStyle bold16Weight=TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.whiteColor

  );
  static final TextStyle bold24Black=TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: AppColors.blackyColor

  );
  static final TextStyle bold16Black=TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: AppColors.blackyColor

  );
  static final TextStyle bold14White=TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: AppColors.whiteColor

  );
  static final TextStyle bold20White=TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: AppColors.whiteColor

  );
  static final TextStyle bold20Black=TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: AppColors.blackyColor

  );
  static final TextStyle bold20Primary=TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: AppColors.primaryColor

  );



  }
