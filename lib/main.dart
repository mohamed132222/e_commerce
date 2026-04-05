import 'package:e_commerce/core/utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'core/utils/app_routes.dart';
import 'feature/screens/auth/login/presentation/login_screen.dart';
import 'feature/screens/auth/register/presentation/register_screen.dart';

void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginScreenRouteName,
      routes: {
        AppRoutes.loginScreenRouteName: (context) => const LoginScreen(),
        AppRoutes.registerScreenRouteName: (context) => const RegisterScreen(),
      },
      theme: AppTheme.lightTheme,
    );
  }
}
