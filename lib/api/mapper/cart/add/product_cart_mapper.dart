import 'package:e_commerce/api/model/response/cart/add_product_cart/product_cart_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/add/product_cart.dart';

extension ProductCartMapper on ProductCartDto {
  ProductCart toProductCart() {
    return ProductCart(id: id, price: price, count: count, product: product);
  }
}
