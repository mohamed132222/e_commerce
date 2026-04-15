import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:e_commerce/domain/repository/brands/brand_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandsUseCase {
  final BrandsRepository _brandsRepository;

  GetAllBrandsUseCase(this._brandsRepository);

  Future<List<CategoryOrBrand>?> call() {
    return _brandsRepository.getAllBrands();
  }
}
