import 'package:e_commerce/api/model/response/cart/get_cart/get_product_cart_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_cart_data_dto.g.dart';

@JsonSerializable()
class GetCartDataDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "cartOwner")
  final String? cartOwner;
  @JsonKey(name: "products")
  final List<GetProductCartDto>? products;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  @JsonKey(name: "totalCartPrice")
  final int? totalCartPrice;

  GetCartDataDto({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory GetCartDataDto.fromJson(Map<String, dynamic> json) {
    return _$GetCartDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetCartDataDtoToJson(this);
  }
}
