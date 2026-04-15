import 'package:e_commerce/domain/entities/response/cart/add/add_product_cart_response.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';

abstract class CartRemoteDataSource {
  Future<AddProductCartResponse> addProductCart(String productId);

  Future<GetCartResponse> getProductsCart();
}
