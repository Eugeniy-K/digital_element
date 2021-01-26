import 'package:equatable/equatable.dart';

//абстракция товара
class Product extends Equatable {

  final int id;
  final String name;
  final double price;
  final int article;
  final Uri image;

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
    final consolidatedProduct = json['items'];
    return Product(
        id: consolidatedProduct['id'] as int,
        name: consolidatedProduct['name'] as String,
        price: consolidatedProduct['price'] as double,
        article: consolidatedProduct['article'] as int,
        image: consolidatedProduct['image'] as Uri
    );
  }
}