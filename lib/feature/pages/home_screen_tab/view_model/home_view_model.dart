import 'package:dio/dio.dart';
import 'package:e_commerce/core/exception/app_exception.dart';
import 'package:e_commerce/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/feature/pages/home_screen_tab/view_model/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  final GetAllBrandsUseCase getAllBrandsUseCase;

  HomeViewModel({
    required this.getAllCategoriesUseCase,
    required this.getAllBrandsUseCase,
  }) : super(HomeInitialState());
  HomeSuccessState successState = HomeSuccessState();

  void getAllCategories() async {
    try {
      emit(CategoryLoadingState());
      var category = await getAllCategoriesUseCase.call();
      emit(successState = successState.copyWith(categoryList: category));
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      emit(CategoryErrorState(message: message));
    } on AppException catch (e) {
      emit(CategoryErrorState(message: e.message));
    }
  }

  void getAllBrand() async {
    try {
      emit(BrandLoadingState());
      var brand = await getAllBrandsUseCase.call();
      emit(successState = successState.copyWith(brandList: brand));
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      emit(BrandErrorState(message: message));
    } on AppException catch (e) {
      emit(BrandErrorState(message: e.message));
    }
  }
}
