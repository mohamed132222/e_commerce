import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/widgets/main_error.dart';
import 'package:e_commerce/core/widgets/main_loading.dart';
import 'package:e_commerce/feature/pages/cart_tab/view_model/cart_state.dart';
import 'package:e_commerce/feature/pages/cart_tab/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  void initState() {
    // TODO: implement initState
    CartViewModel.get(context).getCart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewModel, CartState>(
      bloc: CartViewModel.get(context),
      builder: (context, state) {
        if (state is GetCartErrorState) {
          return MainError(title: state.errorMessage, onTap: () {});
        } else if (state is GetCartSuccessState) {
          return Scaffold(
            backgroundColor: Colors.white,

            appBar: AppBar(
              iconTheme: IconThemeData(color: AppColor.primaryColor),
              title: Text(
                "Cart",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryDarkColor,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                Icon(Icons.search, size: 32.sp),
                SizedBox(width: 10.w),
                Badge(
                  textColor: AppColor.whiteColor,
                  isLabelVisible: true,
                  label: Text(
                    CartViewModel.get(context).numOfCartItem.toString(),
                  ),
                  backgroundColor: AppColor.greenColor,
                  largeSize: 20,
                  smallSize: 15,
                  alignment: Alignment.topCenter,

                  child: Icon(Icons.shopping_cart_outlined, size: 32.sp),
                ),
                SizedBox(width: 10.w),
              ],
            ),

            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  /// LIST
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => Text(
                        state.getCartResponse.data!.products![index].title
                            .toString(),
                      ),

                      itemCount:
                          state.getCartResponse.data?.products?.length ?? 0,
                    ),
                  ),

                  /// BOTTOM SECTION
                  Container(
                    margin: EdgeInsets.only(
                      right: 10.w,
                      left: 10.w,
                      bottom: 25.h,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16.h),

                    child: Row(
                      children: [
                        /// Total
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total price",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.blueGrey.shade500,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "EGP ${state.getCartResponse.data?.totalCartPrice?.toDouble()}",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryDarkColor,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(width: 20.w),

                        /// Button
                        Expanded(
                          child: Container(
                            height: 50.h,

                            decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Check Out",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                  size: 18.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return MainLoading();
        }
      },
    );
  }
}
