import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildLabel extends StatelessWidget {
  BuildLabel({required this.text, required this.colors});

  final String text;
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: colors,
        ),
      ),
    );
    ;
  }
}
