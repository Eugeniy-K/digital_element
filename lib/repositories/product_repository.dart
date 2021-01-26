import 'dart:async';
import 'package:digital_element/models/models.dart';
import 'package:digital_element/repositories/repositories.dart';
import 'package:meta/meta.dart';

class ProductRepository {
  final ProductApiClient productApiClient;

  ProductRepository({@required this.productApiClient})
    : assert(productApiClient != null);

  Future<List<Product>> getProduct() async {
    return productApiClient.fetchProduct();
  }
}