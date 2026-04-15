import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mapper/category_or_brand/category_or_brand_mapper.dart';
import 'package:e_commerce/core/exception/app_exception.dart';
import 'package:e_commerce/data/data_sources/remote/brand/brand_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandRemoteDataSource)
class BrandRemoteDataSourceImpl implements BrandRemoteDataSource {
  final ApiServices _apiServices;

  BrandRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<CategoryOrBrand>?> getAllBrands() async {
    try {
      var brands = await _apiServices.getAllBrands();
      return brands.data
          ?.map((brandDto) => brandDto.toCategoryOrBrand())
          .toList();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
