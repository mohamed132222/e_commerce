import 'package:dio/dio.dart';
import 'package:e_commerce/api/model/request/cart/add_cart_request/add_cart_request_dto.dart';
import 'package:e_commerce/api/model/response/auth/auth_response_dto.dart';
import 'package:e_commerce/api/model/response/cart/add_product_cart/add_product_cart_response_dto.dart';
import 'package:e_commerce/api/model/response/cart/get_cart/get_cart_response_dto.dart';
import 'package:e_commerce/api/model/response/product/product_response_dto.dart';
import 'package:retrofit/retrofit.dart';

import 'api_endpoint.dart';
import 'model/request/auth/login/login_request_dto.dart';
import 'model/request/auth/register/register_request_dto.dart';
import 'model/response/category_or_brand/category_or_brand_response_dto.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiEndpoint.login)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequestDto);

  @POST(ApiEndpoint.register)
  Future<AuthResponseDto> register(
    @Body() RegisterRequestDto registerRequestDto,
  );

  @GET(ApiEndpoint.categories)
  Future<CategoryOrBrandResponseDto> getAllCategories();

  @GET(ApiEndpoint.brands)
  Future<CategoryOrBrandResponseDto> getAllBrands();

  @GET(ApiEndpoint.products)
  Future<ProductResponseDto> getAllProducts();

  @POST(ApiEndpoint.cart)
  Future<AddProductCartResponseDto> addProductCart(
    @Body() AddCartRequestDto addCartRequestDto,
    @Header("token") String token,
  );

  @GET(ApiEndpoint.cart)
  Future<GetCartResponseDto> getProductsCart(@Header("token") String token);
}
