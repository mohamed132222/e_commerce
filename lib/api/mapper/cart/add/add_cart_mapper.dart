import 'package:e_commerce/api/mapper/cart/add/product_cart_mapper.dart';
import 'package:e_commerce/api/model/response/cart/add_product_cart/add_cart_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/add/add_cart.dart';

extension AddCartMapper on AddCartDto {
  AddCart toAddCart() {
    return AddCart(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      cartOwner: cartOwner,
      products: products?.map((product) => product.toProductCart()).toList(),
      totalCartPrice: totalCartPrice,
      v: v,
    );
  }
}
