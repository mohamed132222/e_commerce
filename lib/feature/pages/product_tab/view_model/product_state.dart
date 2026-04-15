import 'package:e_commerce/domain/entities/response/product/product.dart';

sealed class ProductState {}

class ProductLoadingState extends ProductState {}

class ProductErrorState extends ProductState {
  String errorMessage;

  ProductErrorState({required this.errorMessage});
}

class ProductSuccessState extends ProductState {
  List<Product>? productsList;

  ProductSuccessState({required this.productsList});
}
