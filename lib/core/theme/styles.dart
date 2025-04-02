import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static TextTheme get textTheme => TextTheme(
        titleLarge: _titleLarge,
        titleMedium: _titleMedium,
        titleSmall: _titleSmall,
        bodyLarge: _bodyLarge,
        bodyMedium: _bodyMedium,
        bodySmall: _bodySmall,
        labelLarge: _labelLarge,
        labelMedium: _labelMedium,
        labelSmall: _labelSmall,
      );

  static TextStyle get _titleLarge => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 22.sp,
      );

  static TextStyle get _titleMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
      );

  static TextStyle get _titleSmall => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
      );

  static TextStyle get _bodyLarge => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20.sp,
      );

  static TextStyle get _bodyMedium => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      );

  static TextStyle get _bodySmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      );

  static TextStyle get _labelLarge => TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 18.sp,
      );

  static TextStyle get _labelMedium => TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 16.sp,
      );

  static TextStyle get _labelSmall => TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 14.sp,
      );
}
