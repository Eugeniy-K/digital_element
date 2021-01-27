import 'dart:ffi';

import 'package:equatable/equatable.dart';

//абстракция товара
class Product extends Equatable {

  final int id;
  final String name;
  final double price;
  final String article;
  final String image;

  const Product({
    this.id,
    this.name,
    this.price,
    this.article,
    this.image});

  @override
  List<Object> get props => [
    id,
    name,
    price,
    article,
    image
  ];

  static Product fromJson(dynamic json) {
    return Product(
        id: json['id'] == null? 0 : json['id'] as int,
        name: json['name'] == null? 'n/a' : json['name'] as String,
        price: checkPrice(json['price']),
        article: json['article'] == null? 0 : json['article'] as String,
        image: json['image'] == null? null : json['image'] as String
    );
  }

  static double checkPrice(dynamic json) {
    if (json == null) return 0.0;
    if (json is String) return double.parse(json);
    if (json is int) return json.toDouble();
    if (json is double) return json;
  }
}