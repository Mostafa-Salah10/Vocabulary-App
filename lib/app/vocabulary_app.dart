import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_app/core/theme/app_theme.dart';
import 'package:vocabulary_app/view/screens/home_view.dart';

class VocabularyApp extends StatelessWidget {
  const VocabularyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder:
          (_, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appTheme,
            home: HomeView(),
          ),
    );
  }
}
