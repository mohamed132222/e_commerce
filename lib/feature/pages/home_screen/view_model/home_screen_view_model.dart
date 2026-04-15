import 'package:e_commerce/feature/pages/favorite_tab/view/favorite_tab.dart';
import 'package:e_commerce/feature/pages/home_screen/view_model/home_screen_state.dart';
import 'package:e_commerce/feature/pages/home_screen_tab/view/home_screen_tab.dart';
import 'package:e_commerce/feature/pages/product_tab/view/product_tab.dart';
import 'package:e_commerce/feature/pages/profile_tab/view/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenState> {
  HomeScreenViewModel() : super(HomeScreenIntialState());

  //todo hold data _ handle logic
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeScreenTab(),
    ProductTab(),
    FavoriteTab(),
    ProfileTab(),
  ];

  void bottomNavigationBarOnTap(int index) {
    selectedIndex = index;
    emit(HomeScreenChangeTab());
  }
}
