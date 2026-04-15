import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';

sealed class HomeState {}

class HomeInitialState extends HomeState {}

class CategoryLoadingState extends HomeState {}

class CategoryErrorState extends HomeState {
  final String message;

  CategoryErrorState({required this.message});
}

// class CategorySuccesState extends HomeState {
//   final List<CategoryOrBrand>? categoryList;
//   CategorySuccesState({required this.categoryList});
// }

class BrandLoadingState extends HomeState {}

class BrandErrorState extends HomeState {
  final String message;

  BrandErrorState({required this.message});
}

// class BrandSuccesState extends HomeState {
//   final List<CategoryOrBrand>? brandList;
//   BrandSuccesState({required this.brandList});
// }

class HomeSuccessState extends HomeState {
  List<CategoryOrBrand>? categoryList;
  List<CategoryOrBrand>? brandList;

  HomeSuccessState({this.categoryList, this.brandList});

  HomeSuccessState copyWith({
    List<CategoryOrBrand>? categoryList,
    List<CategoryOrBrand>? brandList,
  }) {
    return HomeSuccessState(
      categoryList: categoryList ?? this.categoryList,
      brandList: brandList ?? this.brandList,
    );
  }
}
