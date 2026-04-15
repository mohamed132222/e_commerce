import 'package:e_commerce/core/exception/app_exception.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_product_cart.dart';
import 'package:e_commerce/domain/use_cases/add_product_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_product_cart_use_case.dart';
import 'package:e_commerce/feature/pages/cart_tab/view_model/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartState> {
  final AddProductCartUseCase addProductCartUseCase;
  final GetProductCartUseCase getProductCartUseCase;

  CartViewModel({
    required this.addProductCartUseCase,
    required this.getProductCartUseCase,
  }) : super(CartInitialState());

  static CartViewModel get(context) => BlocProvider.of<CartViewModel>(context);

  int numOfCartItem = 0;
  List<GetProductCart>? productList;

  addProductToCart(String productId) async {
    try {
      emit(CartLoadingState());
      var addCartResponse = await addProductCartUseCase.call(productId);
      numOfCartItem = addCartResponse.numOfCartItems ?? 0;
      print(numOfCartItem);
      emit(CartSuccessState(addProductCartResponse: addCartResponse));
    } on AppException catch (e) {
      emit(CartErrorState(errorMessage: e.message));
    } catch (e) {
      emit(CartErrorState(errorMessage: e.toString()));
    }
  }

  getCart() async {
    try {
      emit(GetCartLoadingState());
      var getCartResponse = await getProductCartUseCase.call();
      numOfCartItem = getCartResponse.numOfCartItems ?? 0;
      productList = getCartResponse.data?.products ?? [];
      print(numOfCartItem);
      emit(GetCartSuccessState(getCartResponse: getCartResponse));
    } on AppException catch (e) {
      emit(GetCartErrorState(errorMessage: e.message));
    } catch (e) {
      emit(GetCartErrorState(errorMessage: e.toString()));
    }
  }
}
