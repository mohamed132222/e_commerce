import 'package:e_commerce/domain/entities/response/common/meta_data.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';

class ProductResponse {
  final int? results;
  final Metadata? metadata;
  final List<Product>? data;

  ProductResponse({this.results, this.metadata, this.data});
}
