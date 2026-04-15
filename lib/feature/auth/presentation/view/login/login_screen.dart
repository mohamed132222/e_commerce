import 'package:e_commerce/core/di/di_inject.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_validator.dart';
import 'package:e_commerce/core/widgets/custom_dialog_utils.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/feature/auth/presentation/view_model/auth_states.dart';
import 'package:e_commerce/feature/auth/presentation/view_model/login_view_model.dart';
import 'package:e_commerce/feature/pages/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/auth_layout.dart';
import '../../../../widgets/build_label.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  LoginViewModel viewModel = getIt<LoginViewModel>();
  bool obscureText = true;
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(context, message: "loading ...");
        } else if (state is AuthSuccessState) {
          DialogUtils.hide(context);
          DialogUtils.success(
            context: context,
            message: "login successfully",
            onOk: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          );
        } else if (state is AuthErrorState) {
          DialogUtils.hide(context);
          DialogUtils.error(
            context: context,
            message: state.errorMessage.message,
          );
        }
      },
      bloc: viewModel,

      child: Scaffold(
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
                      "Welcome Back To Matgary",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.whiteColor,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "Please sign in with your email",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColor.whiteColor,
                      ),
                    ),

                    SizedBox(height: 25.h),

                    // ================= USERNAME =================
                    BuildLabel(text: "Email", colors: AppColor.whiteColor),
                    CustomTextFormField(
                      controller: _emailController,
                      hintText: "Enter your email",
                      validator: (value) => AppValidator.validateEmail(value),
                    ),

                    SizedBox(height: 10.h),

                    // ================= PASSWORD =================
                    BuildLabel(text: "Password", colors: AppColor.whiteColor),
                    CustomTextFormField(
                      controller: _passwordController,
                      hintText: "Enter your password",
                      obscureText: obscureText,
                      validator: (value) =>
                          AppValidator.validatePassword(value),
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
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      //login
      viewModel.login(_emailController.text, _passwordController.text);
    }
  }
}
