import 'package:e_commerce/domain/entities/response/cart/add/add_product_cart_response.dart';
import 'package:e_commerce/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddProductCartUseCase {
  final CartRepository _cartRepository;

  AddProductCartUseCase(this._cartRepository);

  Future<AddProductCartResponse> call(String productId) {
    return _cartRepository.addProductCart(productId);
  }
}
