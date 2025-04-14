import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vocabulary_app/core/constants/app_colors.dart';
import 'package:vocabulary_app/core/constants/app_text_styles.dart';

abstract class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      color: AppColors.black,
      centerTitle: true,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.black),
    ),
    textTheme: TextTheme(
      headlineMedium: AppTextStyles.cairo25Bold,
      headlineSmall: AppTextStyles.cairo18Bold,
    ),
    iconTheme: IconThemeData(color: AppColors.white, size: 30),
  );
}
