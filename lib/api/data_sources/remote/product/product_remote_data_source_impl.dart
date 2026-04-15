import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mapper/product/product_mapper.dart';
import 'package:e_commerce/data/data_sources/remote/product/product_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exception/app_exception.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiServices _apiServices;

  ProductRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<Product>?> getAllProducts() async {
    try {
      var products = await _apiServices.getAllProducts();
      //todo ProductDto=>product
      return products.data
          ?.map((productDto) => productDto.toProduct())
          .toList();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
