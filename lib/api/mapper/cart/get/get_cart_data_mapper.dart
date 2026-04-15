import 'package:e_commerce/api/mapper/cart/get/get_products_cart_mapper.dart';
import 'package:e_commerce/api/model/response/cart/get_cart/get_cart_data_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_data.dart';

extension GetCartDataMapper on GetCartDataDto {
  GetCartData toCartData() {
    return GetCartData(
      id: id,
      v: v,
      totalCartPrice: totalCartPrice,
      cartOwner: cartOwner,
      updatedAt: updatedAt,
      createdAt: createdAt,
      products: products?.map((product) => product.toGetProductCart()).toList(),
    );
  }
}
