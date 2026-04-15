import 'package:e_commerce/core/di/di_inject.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/widgets/custom_toast.dart';
import 'package:e_commerce/core/widgets/main_error.dart';
import 'package:e_commerce/core/widgets/main_loading.dart';
import 'package:e_commerce/feature/pages/cart_tab/view_model/cart_state.dart';
import 'package:e_commerce/feature/pages/cart_tab/view_model/cart_view_model.dart';
import 'package:e_commerce/feature/pages/product_tab/view/widgets/product_item.dart';
import 'package:e_commerce/feature/pages/product_tab/view_model/product_state.dart';
import 'package:e_commerce/feature/pages/product_tab/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home_screen/view/widgets/build_appbar.dart';

class ProductTab extends StatefulWidget {
  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  ProductViewModel viewModel = getIt<ProductViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        onCartPressed: () =>
            Navigator.pushNamed(context, AppRoutes.cartScreenRouteName),
      ),
      body: SafeArea(
        child: BlocListener<CartViewModel, CartState>(
          listener: (context, state) {
            if (state is CartSuccessState) {
              ToastHelper.showSuccess("product added successfully");
            } else if (state is CartErrorState) {
              ToastHelper.showError(state.errorMessage);
            }
          },
          child: BlocBuilder<ProductViewModel, ProductState>(
            bloc: viewModel..getProducts(),
            builder: (context, state) {
              if (state is ProductErrorState) {
                return MainError(title: state.errorMessage, onTap: () {});
              } else if (state is ProductSuccessState) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: GridView.builder(
                    itemCount: state.productsList!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: .65,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRoutes.productDetailsScreenRouteName,
                          arguments: state.productsList![index],
                        ),
                        child: ProductItem(
                          product: state.productsList![index],
                          isFavorite: true,
                          onFavoritePressed: () {},
                        ),
                      );
                    },
                  ),
                );
              } else {
                return MainLoading();
              }
            },
          ),
        ),
      ),
    );
  }
}
