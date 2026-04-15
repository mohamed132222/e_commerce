import 'package:e_commerce/core/di/di_inject.dart';
import 'package:e_commerce/core/utils/app_asset.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/feature/pages/home_screen/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/home_screen_state.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = getIt<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenState>(
      bloc: viewModel,
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: viewModel.tabs[viewModel.selectedIndex],
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadiusGeometry.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Theme(
            data: Theme.of(
              context,
            ).copyWith(canvasColor: AppColor.primaryColor),
            child: BottomNavigationBar(
              onTap: viewModel.bottomNavigationBarOnTap,
              items: [
                _bottomNavigationBarItem(
                  isSelected: viewModel.selectedIndex == 0,
                  SelectedIcon: AppAsset.home_selected,
                  UnSelectedIcon: AppAsset.home,
                ),
                _bottomNavigationBarItem(
                  isSelected: viewModel.selectedIndex == 1,
                  SelectedIcon: AppAsset.category_selected,
                  UnSelectedIcon: AppAsset.category,
                ),
                _bottomNavigationBarItem(
                  isSelected: viewModel.selectedIndex == 2,
                  SelectedIcon: AppAsset.favorite_selected,
                  UnSelectedIcon: AppAsset.favorite,
                ),
                _bottomNavigationBarItem(
                  isSelected: viewModel.selectedIndex == 3,
                  SelectedIcon: AppAsset.profile,
                  UnSelectedIcon: AppAsset.profile_unselected,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    required bool isSelected,
    required String SelectedIcon,
    required String UnSelectedIcon,
  }) {
    return BottomNavigationBarItem(
      label: "",
      icon: CircleAvatar(
        foregroundColor: isSelected
            ? AppColor.primaryColor
            : AppColor.whiteColor,
        backgroundColor: isSelected
            ? AppColor.whiteColor
            : AppColor.primaryColor,
        child: Image.asset(isSelected ? SelectedIcon : UnSelectedIcon),
        radius: 15,
      ),
    );
  }
}
