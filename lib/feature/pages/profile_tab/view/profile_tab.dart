import 'package:e_commerce/core/cahce/shared_pref_utils.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_validator.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/feature/widgets/build_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_routes.dart';

class ProfileTab extends StatelessWidget {
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController address = TextEditingController();

  ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.h,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Welcome, Mohamed",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryDarkColor,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "mohamed.N@gmail.com",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColor.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      SharedPrefUtils.removeData(key: "token");
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.loginScreenRouteName,
                        (route) => false,
                      );
                    },
                    icon: Icon(Icons.logout, color: AppColor.primaryDarkColor),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              BuildLabel(
                text: "Your FullName",
                colors: AppColor.primaryDarkColor,
              ),

              CustomTextFormField(
                controller: fullname,
                borderRadius: BorderRadius.circular(18.r),
                keyboardType: TextInputType.text,
                validator: (p0) => AppValidator.validateFullName(p0),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Icon(Icons.edit, color: AppColor.primaryDarkColor),
                ),
              ),
              BuildLabel(
                text: "Your E_mail",
                colors: AppColor.primaryDarkColor,
              ),

              CustomTextFormField(
                controller: email,
                borderRadius: BorderRadius.circular(18.r),
                keyboardType: TextInputType.emailAddress,
                validator: (p0) => AppValidator.validateEmail(p0),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Icon(Icons.edit, color: AppColor.primaryDarkColor),
                ),
              ),
              BuildLabel(
                text: "Your Password",
                colors: AppColor.primaryDarkColor,
              ),

              CustomTextFormField(
                controller: password,
                borderRadius: BorderRadius.circular(18.r),
                keyboardType: TextInputType.text,
                validator: (p0) => AppValidator.validatePassword(p0),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Icon(Icons.edit, color: AppColor.primaryDarkColor),
                ),
              ),
              BuildLabel(
                text: "Your mobile",
                colors: AppColor.primaryDarkColor,
              ),

              CustomTextFormField(
                controller: mobile,
                borderRadius: BorderRadius.circular(18.r),
                keyboardType: TextInputType.phone,
                validator: (p0) => AppValidator.validateMobile(p0),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Icon(Icons.edit, color: AppColor.primaryDarkColor),
                ),
              ),
              BuildLabel(
                text: "Your address",
                colors: AppColor.primaryDarkColor,
              ),

              CustomTextFormField(
                controller: address,
                borderRadius: BorderRadius.circular(18.r),
                keyboardType: TextInputType.text,

                suffixIcon: InkWell(
                  onTap: () {},
                  child: Icon(Icons.edit, color: AppColor.primaryDarkColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
