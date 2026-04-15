// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductCartDto _$GetProductCartDtoFromJson(Map<String, dynamic> json) =>
    GetProductCartDto(
      subcategory: (json['subcategory'] as List<dynamic>?)
          ?.map((e) => SubcategoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['_id'] as String?,
      title: json['title'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      imageCover: json['imageCover'] as String?,
      category: json['category'] == null
          ? null
          : CategoryOrBrandDto.fromJson(
              json['category'] as Map<String, dynamic>,
            ),
      brand: json['brand'] == null
          ? null
          : CategoryOrBrandDto.fromJson(json['brand'] as Map<String, dynamic>),
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetProductCartDtoToJson(GetProductCartDto instance) =>
    <String, dynamic>{
      'subcategory': instance.subcategory,
      '_id': instance.id,
      'title': instance.title,
      'quantity': instance.quantity,
      'imageCover': instance.imageCover,
      'category': instance.category,
      'brand': instance.brand,
      'ratingsAverage': instance.ratingsAverage,
      'price': instance.price,
    };
