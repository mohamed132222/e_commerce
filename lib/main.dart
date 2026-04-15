import 'package:e_commerce/core/cahce/shared_pref_utils.dart';
import 'package:e_commerce/core/utils/app_theme.dart';
import 'package:e_commerce/feature/pages/cart_tab/view_model/cart_view_model.dart';
import 'package:e_commerce/feature/pages/favorite_tab/view/favorite_tab.dart';
import 'package:e_commerce/feature/pages/home_screen/view/home_screen.dart';
import 'package:e_commerce/feature/pages/home_screen_tab/view/home_screen_tab.dart';
import 'package:e_commerce/feature/pages/product_tab/view/product_tab.dart';
import 'package:e_commerce/feature/pages/profile_tab/view/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di_inject.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/bloc_observer.dart';
import 'feature/auth/presentation/view/login/login_screen.dart';
import 'feature/auth/presentation/view/register/register_screen.dart';
import 'feature/pages/cart_tab/view/cart_tab.dart';
import 'feature/pages/product_tab/view/product_details_screen.dart';
import 'feature/splash/presentation/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  await SharedPrefUtils.init();
  String routeName = "";
  var token = SharedPrefUtils.readData(key: "token");
  if (token == null) {
    routeName = AppRoutes.loginScreenRouteName;
  } else {
    routeName = AppRoutes.homeScreenRouteName;
  }
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<CartViewModel>())],
      child: EcommerceApp(routeName: routeName),
    ),
  );
}

class EcommerceApp extends StatelessWidget {
  String routeName;

  EcommerceApp({required this.routeName});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: routeName,
        routes: {
          AppRoutes.splashScreenRouteName: (context) => const SplashScreen(),
          AppRoutes.loginScreenRouteName: (context) => LoginScreen(),
          AppRoutes.registerScreenRouteName: (context) => RegisterScreen(),
          AppRoutes.homeScreenRouteName: (context) => HomeScreen(),
          AppRoutes.productScreenRouteName: (context) => ProductTab(),
          AppRoutes.homeScreenTabRouteName: (context) => HomeScreenTab(),
          AppRoutes.profileScreenRouteName: (context) => ProfileTab(),
          AppRoutes.favoriteScreenRouteName: (context) => FavoriteTab(),
          AppRoutes.productDetailsScreenRouteName: (context) =>
              ProductDetailsScreen(),
          AppRoutes.cartScreenRouteName: (context) => CartTab(),
        },
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
