import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mapper/cart/add/add_product_cart_mapper.dart';
import 'package:e_commerce/api/mapper/cart/get/get_cart_mapper.dart';
import 'package:e_commerce/api/model/request/cart/add_cart_request/add_cart_request_dto.dart';
import 'package:e_commerce/core/cahce/shared_pref_utils.dart';
import 'package:e_commerce/core/exception/app_exception.dart';
import 'package:e_commerce/data/data_sources/remote/cart/cart_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/cart/add/add_product_cart_response.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiServices _apiServices;

  CartRemoteDataSourceImpl(this._apiServices);

  @override
  Future<AddProductCartResponse> addProductCart(String productId) async {
    try {
      var token = SharedPrefUtils.readData(key: "token");
      var addCartRequestDto = AddCartRequestDto(productId: productId);
      var addProductCart = await _apiServices.addProductCart(
        addCartRequestDto,
        token.toString(),
      );
      //todo addProductCartDto=>AddProductCart
      return addProductCart.toAddProductCartResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> getProductsCart() async {
    try {
      var token = SharedPrefUtils.readData(key: "token");
      var getProductsCart = await _apiServices.getProductsCart(
        token.toString(),
      );
      //todo getProductsCartDto=>getProductCart
      return getProductsCart.toGetCartResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
