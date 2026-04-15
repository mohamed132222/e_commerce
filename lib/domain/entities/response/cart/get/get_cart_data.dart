import 'package:e_commerce/domain/entities/response/cart/get/get_product_cart.dart';

class GetCartData {
  final String? id;
  final String? cartOwner;
  final List<GetProductCart>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? totalCartPrice;

  GetCartData({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}
