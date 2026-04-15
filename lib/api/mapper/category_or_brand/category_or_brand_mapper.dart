import 'package:e_commerce/api/model/response/common/category_or_brand_dto.dart';
import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';

extension CategoryOrBrandMapper on CategoryOrBrandDto {
  CategoryOrBrand toCategoryOrBrand() {
    return CategoryOrBrand(
      name: name,
      image: image,
      id: id,
      createdAt: createdAt,
      slug: slug,
      updatedAt: updatedAt,
    );
  }
}
