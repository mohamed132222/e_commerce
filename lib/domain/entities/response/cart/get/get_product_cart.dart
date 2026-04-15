import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:e_commerce/domain/entities/response/product/sub_category.dart';

class GetProductCart {
  final List<Subcategory>? subcategory;
  final String? id;
  final String? title;
  final int? quantity;
  final String? imageCover;
  final CategoryOrBrand? category;
  final CategoryOrBrand? brand;
  final double? ratingsAverage;
  final int? price;

  GetProductCart({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.price,
  });
}
