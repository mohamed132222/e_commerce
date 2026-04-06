import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_validator.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/feature/screens/auth/widgets/auth_layout.dart';
import 'package:e_commerce/feature/screens/auth/widgets/build_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: AuthLayout(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ================= TITLE =================
                  Text(
                    "Welcome Back To Route",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.whiteColor,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    "Please sign in with your mail",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColor.whiteColor,
                    ),
                  ),

                  SizedBox(height: 25.h),

                  // ================= USERNAME =================
                  BuildLabel(text: "User Name"),
                  CustomTextFormField(
                    controller: _usernameController,
                    hintText: "Enter your username",
                    validator: (value) => AppValidator.validateFullName(value),
                  ),

                  SizedBox(height: 10.h),

                  // ================= PASSWORD =================
                  BuildLabel(text: "Password"),
                  CustomTextFormField(
                    controller: _passwordController,
                    hintText: "Enter your password",
                    obscureText: obscureText,
                    validator: (value) => AppValidator.validatePassword(value),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Icon(Icons.remove_red_eye_rounded),
                    ),
                  ),

                  SizedBox(height: 5.h),

                  // ================= FORGET PASSWORD =================
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // ================= BUTTON =================
                  ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),

                  SizedBox(height: 15.h),

                  // ================= REGISTER =================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account? ",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.registerScreenRouteName,
                          );
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      //login
    }
  }
}
