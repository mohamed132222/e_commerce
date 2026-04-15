import 'package:e_commerce/core/di/di_inject.dart';
import 'package:e_commerce/core/utils/app_asset.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/widgets/main_error.dart';
import 'package:e_commerce/core/widgets/main_loading.dart';
import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:e_commerce/feature/pages/home_screen_tab/view/widgets/category_brand_item.dart';
import 'package:e_commerce/feature/pages/home_screen_tab/view_model/home_state.dart';
import 'package:e_commerce/feature/pages/home_screen_tab/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cart_tab/view_model/cart_view_model.dart';
import '../../home_screen/view/widgets/build_appbar.dart';

class HomeScreenTab extends StatefulWidget {
  @override
  State<HomeScreenTab> createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab> {
  HomeViewModel viewModel = getIt<HomeViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    viewModel.getAllCategories();
    viewModel.getAllBrand();
    CartViewModel.get(context).getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15.h),
            _imageSlideshow(
              images: [AppAsset.ads1, AppAsset.ads2, AppAsset.ads3],
            ),
            SizedBox(height: 10.h),
            _buildLine(title: "Categories", onTap: () {}),
            SizedBox(height: 10.h),
            BlocBuilder<HomeViewModel, HomeState>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is CategoryErrorState) {
                  return MainError(title: state.message, onTap: () {});
                } else if (state is HomeSuccessState) {
                  return _buildCategoryBrand(state.categoryList ?? []);
                } else {
                  return MainLoading();
                }
              },
            ),
            SizedBox(height: 10.h),
            _buildLine(title: "Brands", onTap: () {}),
            SizedBox(height: 10.h),
            BlocBuilder<HomeViewModel, HomeState>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is BrandErrorState) {
                  return MainError(title: state.message, onTap: () {});
                } else if (state is HomeSuccessState) {
                  return _buildCategoryBrand(state.brandList ?? []);
                } else {
                  return MainLoading();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  ImageSlideshow _imageSlideshow({required List<String> images}) {
    return ImageSlideshow(
      children: images.map((e) {
        return Image.asset(e, fit: BoxFit.cover);
      }).toList(),
      indicatorColor: AppColor.primaryColor,
      indicatorBackgroundColor: AppColor.whiteColor,
      isLoop: true,

      indicatorRadius: 5.r,
      indicatorPadding: 8.w,
      initialPage: 0,
      autoPlayInterval: 3000,
      height: 190.h,

      indicatorBottomPadding: 15.h,
    );
  }

  Widget _buildLine({required String title, required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            color: AppColor.primaryDarkColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            "view all",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.primaryDarkColor,
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _buildCategoryBrand(List<CategoryOrBrand> list) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
        ),
        itemBuilder: (context, index) => CategoryBrandItem(item: list[index]),
        itemCount: list.length,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
