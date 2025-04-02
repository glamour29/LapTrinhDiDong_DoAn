import 'package:calc_pro/core/theme/colors.dart';
import 'package:calc_pro/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData getTheme({required AppColors appColors}) {
    return ThemeData(
        brightness: appColors.brightness,
        useMaterial3: true,
        textTheme: Styles.textTheme,
        scaffoldBackgroundColor: appColors.scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: appColors.buttonBackgroundColor,
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          actionsIconTheme: IconThemeData(size: 24.w, color: Colors.white),
          iconTheme: IconThemeData(size: 24.w, color: Colors.white),
          titleTextStyle:
              Styles.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: appColors.progressColor,
          strokeWidth: 0.3,
        ),
        dividerTheme: DividerThemeData(
          color: appColors.dividerColor,
          thickness: 1,
          space: 0,
        ));
  }
}
