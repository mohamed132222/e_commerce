import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_validator.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/di/di_inject.dart';
import '../../../../../core/widgets/custom_dialog_utils.dart';
import '../../../../widgets/auth_layout.dart';
import '../../view_model/auth_states.dart';
import '../../view_model/register_view_model.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool obscureText = true;
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          //todo show loading
          DialogUtils.showLoading(context, message: "loading ...");
        } else if (state is AuthSuccessState) {
          //todo show success
          DialogUtils.hide(context);
          DialogUtils.success(
            context: context,
            message: "register successfully",
          );
        } else if (state is AuthErrorState) {
          //todo show error
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
                    SizedBox(height: 20.h),

                    // ================= EMAIL =================
                    buildLabel("Email"),
                    CustomTextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      borderRadius: BorderRadius.circular(15.r),
                      hintText: "Enter your email",
                      validator: (value) => AppValidator.validateEmail(value),
                    ),

                    SizedBox(height: 10.h),

                    // ================= USERNAME =================
                    buildLabel("User Name"),
                    CustomTextFormField(
                      controller: _usernameController,
                      hintText: "Enter your username",
                      validator: (value) =>
                          AppValidator.validateFullName(value),
                    ),

                    SizedBox(height: 10.h),

                    // ================= PHONE =================
                    buildLabel("Phone"),
                    CustomTextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      hintText: "Enter your phone",
                      validator: (value) => AppValidator.validateMobile(value),
                    ),

                    SizedBox(height: 10.h),

                    // ================= PASSWORD =================
                    buildLabel("Password"),
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

                    SizedBox(height: 10.h),

                    // ================= CONFIRM =================
                    buildLabel("Confirm Password"),
                    CustomTextFormField(
                      controller: _confirmPasswordController,
                      hintText: "Confirm password",
                      obscureText: obscureText,
                      validator: (value) =>
                          AppValidator.validateConfirmPassword(
                            value,
                            _passwordController.text,
                          ),
                    ),

                    SizedBox(height: 20.h),

                    // ================= BUTTON =================
                    ElevatedButton(
                      onPressed: register,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),

                    SizedBox(height: 10.h),

                    // ================= LOGIN =================
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.loginScreenRouteName,
                        );
                      },
                      child: Text(
                        "I have an account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColor.whiteColor,
                        ),
                      ),
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

  Widget buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.whiteColor,
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState!.validate()) {
      //register
      viewModel.register(
        _passwordController.text,
        _emailController.text,
        _confirmPasswordController.text,
        _phoneController.text,
        _usernameController.text,
      );
    }
  }
}
