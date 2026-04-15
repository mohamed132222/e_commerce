import 'package:e_commerce/api/mapper/category_or_brand/category_or_brand_mapper.dart';
import 'package:e_commerce/api/mapper/product/sub_category_mapper.dart';
import 'package:e_commerce/api/model/response/product/product_dto.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';

extension ProductMapper on ProductDto {
  Product toProduct() {
    return Product(
      id: id,
      updatedAt: updatedAt,
      slug: slug,
      createdAt: createdAt,
      title: title,
      brand: brand?.toCategoryOrBrand(),
      category: category?.toCategoryOrBrand(),
      description: description,
      imageCover: imageCover,
      images: images,
      price: price,
      quantity: quantity,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      sold: sold,
      //todo subCategoryDto=>subCategory
      subcategory: subcategory
          ?.map((subCategoryDto) => subCategoryDto.toSubCategory())
          .toList(),
    );
  }
}
