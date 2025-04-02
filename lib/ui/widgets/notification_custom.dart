import 'package:calc_pro/core/extensions/context_extension.dart';
import 'package:calc_pro/ui/widgets/load_lottie_json.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCustom extends StatelessWidget {
  const NotificationCustom(
      {super.key,
      required this.asset,
      required this.title,
      required this.message});

  final String asset;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 80.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadLottieJson(asset: asset),
          Text(
            title,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Text(
            message,
            style: context.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
