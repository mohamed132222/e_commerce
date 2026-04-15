import 'package:e_commerce/api/mapper/cart/get/get_cart_data_mapper.dart';
import 'package:e_commerce/api/model/response/cart/get_cart/get_cart_response_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';

extension GetProductsCartMapper on GetCartResponseDto {
  GetCartResponse toGetCartResponse() {
    return GetCartResponse(
      cartId: cartId,
      numOfCartItems: numOfCartItems,
      status: status,
      //GetCartDataDto =>GetCartData
      data: data?.toCartData(),
    );
  }
}
