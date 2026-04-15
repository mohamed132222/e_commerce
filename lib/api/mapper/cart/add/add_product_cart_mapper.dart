import 'package:e_commerce/api/mapper/cart/add/add_cart_mapper.dart';
import 'package:e_commerce/api/model/response/cart/add_product_cart/add_product_cart_response_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/add/add_product_cart_response.dart';

extension AddProductCartMapper on AddProductCartResponseDto {
  AddProductCartResponse toAddProductCartResponse() {
    return AddProductCartResponse(
      status: status,
      message: message,
      numOfCartItems: numOfCartItems,
      cartId: cartId,
      data: data?.toAddCart(),
    );
  }
}
