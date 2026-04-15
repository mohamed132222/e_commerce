import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mapper/category_or_brand/category_or_brand_mapper.dart';
import 'package:e_commerce/data/data_sources/remote/category/category_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exception/app_exception.dart';

@Injectable(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiServices _apiServices;

  CategoryRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<CategoryOrBrand>?> getAllCategories() async {
    try {
      var categories = await _apiServices.getAllCategories();
      //todo CategoryOrBrandDto=>CategoryOrBrand
      return categories.data
          ?.map((categoryDto) => categoryDto.toCategoryOrBrand())
          .toList();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
