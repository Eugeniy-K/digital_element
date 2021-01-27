import 'dart:convert';

import 'package:digital_element/models/models.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:http/http.dart' as http;

//класс отвечает за запросы к серверу
class ProductApiClient {
  static const baseUrl = "https://d-element.ru/test_api.php";
  final http.Client httpClient;

  ProductApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Product>> fetchProduct() async {
    final productResponse = await this.httpClient.get(baseUrl);

    if (productResponse.statusCode != 200) {
      throw Exception('Что то пошло не так');
    }
    var productJson = jsonDecode(productResponse.body)['items'] as List;
    List<Product> products = productJson.map((prodJson) => Product.fromJson(prodJson)).toList();

    return products;
  }
}