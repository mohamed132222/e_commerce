// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCartDto _$ProductCartDtoFromJson(Map<String, dynamic> json) =>
    ProductCartDto(
      count: (json['count'] as num?)?.toInt(),
      id: json['_id'] as String?,
      product: json['product'] as String?,
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductCartDtoToJson(ProductCartDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      '_id': instance.id,
      'product': instance.product,
      'price': instance.price,
    };
