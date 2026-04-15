import 'package:e_commerce/core/exception/app_exception.dart';
import 'package:e_commerce/domain/use_cases/add_product_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce/feature/pages/product_tab/view_model/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductViewModel extends Cubit<ProductState> {
  final GetAllProductsUseCase getAllProductsUseCase;
  final AddProductCartUseCase addProductCartUseCase;

  static ProductViewModel get(context) =>
      BlocProvider.of<ProductViewModel>(context);

  ProductViewModel({
    required this.getAllProductsUseCase,
    required this.addProductCartUseCase,
  }) : super(ProductLoadingState());

  getProducts() async {
    try {
      emit(ProductLoadingState());
      var productResponse = await getAllProductsUseCase.call();
      emit(ProductSuccessState(productsList: productResponse));
    } on AppException catch (e) {
      emit(ProductErrorState(errorMessage: e.message));
    } catch (e) {
      emit(ProductErrorState(errorMessage: e.toString()));
    }
  }
}
