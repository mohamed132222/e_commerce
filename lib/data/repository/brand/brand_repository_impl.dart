import 'package:dio/dio.dart';
import 'package:e_commerce/core/exception/app_exception.dart';
import 'package:e_commerce/data/data_sources/remote/brand/brand_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:e_commerce/domain/repository/brands/brand_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepository)
class BrandRepositoryImpl implements BrandsRepository {
  final BrandRemoteDataSource _brandRemoteDataSource;

  BrandRepositoryImpl(this._brandRemoteDataSource);

  @override
  Future<List<CategoryOrBrand>?> getAllBrands() {
    try {
      return _brandRemoteDataSource.getAllBrands();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
