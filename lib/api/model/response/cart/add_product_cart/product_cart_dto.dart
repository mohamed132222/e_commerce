import 'package:json_annotation/json_annotation.dart';

part 'product_cart_dto.g.dart';

@JsonSerializable()
class ProductCartDto {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "product")
  final String? product;
  @JsonKey(name: "price")
  final int? price;

  ProductCartDto({this.count, this.id, this.product, this.price});

  factory ProductCartDto.fromJson(Map<String, dynamic> json) {
    return _$ProductCartDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductCartDtoToJson(this);
  }
}
