import 'package:e_commerce/domain/entities/response/cart/add/add_product_cart_response.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';

sealed class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  AddProductCartResponse addProductCartResponse;

  CartSuccessState({required this.addProductCartResponse});
}

class CartErrorState extends CartState {
  final String errorMessage;

  CartErrorState({required this.errorMessage});
}

class GetCartLoadingState extends CartState {}

class GetCartSuccessState extends CartState {
  GetCartResponse getCartResponse;

  GetCartSuccessState({required this.getCartResponse});
}

class GetCartErrorState extends CartState {
  final String errorMessage;

  GetCartErrorState({required this.errorMessage});
}
