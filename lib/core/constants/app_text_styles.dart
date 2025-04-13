import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_app/core/constants/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle cairo20Bold = _textStyle(
    fontSize: 25,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle _textStyle({
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontFamily: 'Cairo',
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
    );
  }
}
