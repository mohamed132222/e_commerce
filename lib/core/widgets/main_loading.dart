import 'package:e_commerce/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class MainLoading extends StatelessWidget {
  const MainLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: AppColor.primaryColor),
    );
  }
}
