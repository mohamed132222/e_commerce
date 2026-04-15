import 'package:e_commerce/domain/entities/response/cart/get/get_cart_data.dart';

class GetCartResponse {
  final String? status;
  final int? numOfCartItems;
  final String? cartId;
  final GetCartData? data;

  GetCartResponse({this.status, this.numOfCartItems, this.cartId, this.data});
}
