import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:e_commerce/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductCartUseCase {
  final CartRepository _cartRepository;

  GetProductCartUseCase(this._cartRepository);

  Future<GetCartResponse> call() {
    return _cartRepository.getProductsCart();
  }
}
