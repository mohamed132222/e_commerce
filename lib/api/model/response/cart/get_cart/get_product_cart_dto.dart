import 'package:e_commerce/api/model/response/common/category_or_brand_dto.dart';
import 'package:e_commerce/api/model/response/product/sub_category_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_product_cart_dto.g.dart';

@JsonSerializable()
class GetProductCartDto {
  @JsonKey(name: "subcategory")
  final List<SubcategoryDto>? subcategory;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "imageCover")
  final String? imageCover;
  @JsonKey(name: "category")
  final CategoryOrBrandDto? category;
  @JsonKey(name: "brand")
  final CategoryOrBrandDto? brand;
  @JsonKey(name: "ratingsAverage")
  final double? ratingsAverage;
  @JsonKey(name: "price")
  final int? price;

  GetProductCartDto({
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

  factory GetProductCartDto.fromJson(Map<String, dynamic> json) {
    return _$GetProductCartDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetProductCartDtoToJson(this);
  }
}
