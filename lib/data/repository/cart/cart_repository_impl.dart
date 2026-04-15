import 'package:e_commerce/data/data_sources/remote/cart/cart_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/cart/add/add_product_cart_response.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:e_commerce/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;

  CartRepositoryImpl(this._cartRemoteDataSource);

  @override
  Future<AddProductCartResponse> addProductCart(String productId) {
    return _cartRemoteDataSource.addProductCart(productId);
  }

  @override
  Future<GetCartResponse> getProductsCart() {
    return _cartRemoteDataSource.getProductsCart();
  }
}
