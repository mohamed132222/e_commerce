import 'package:e_commerce/api/mapper/category_or_brand/category_or_brand_mapper.dart';
import 'package:e_commerce/api/mapper/product/sub_category_mapper.dart';
import 'package:e_commerce/api/model/response/cart/get_cart/get_product_cart_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_product_cart.dart';

extension GetProductsCartMapper on GetProductCartDto {
  GetProductCart toGetProductCart() {
    return GetProductCart(
      id: id,
      category: category?.toCategoryOrBrand(),
      subcategory: subcategory
          ?.map((subcategory) => subcategory.toSubCategory())
          .toList(),
      ratingsAverage: ratingsAverage,
      quantity: quantity,
      imageCover: imageCover,
      brand: brand?.toCategoryOrBrand(),
      title: title,
    );
  }
}
