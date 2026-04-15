import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:e_commerce/domain/entities/response/common/meta_data.dart';

class CategoryOrBrandResponseDto {
  final int? results;
  final Metadata? metadata;
  final List<CategoryOrBrand>? data;

  CategoryOrBrandResponseDto({this.results, this.metadata, this.data});
}
