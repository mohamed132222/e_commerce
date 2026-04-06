import 'package:e_commerce/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/app_routes.dart';
import 'feature/screens/auth/login/presentation/login_screen.dart';
import 'feature/screens/auth/register/presentation/register_screen.dart';
import 'feature/screens/splash/presentation/splash_screen.dart';

void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splashScreenRouteName,
        routes: {
          AppRoutes.splashScreenRouteName: (context) => const SplashScreen(),
          AppRoutes.loginScreenRouteName: (context) => LoginScreen(),
          AppRoutes.registerScreenRouteName: (context) => RegisterScreen(),
        },
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
