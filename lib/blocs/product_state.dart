import 'package:digital_element/models/models.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

//класс состояний приложения
abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

//начальное состояние
class ProductInitial extends ProductState {}

//состояние запроса
class ProductLoadInProgress extends ProductState {}

//загрузка прошла успешно
class ProductLoadSuccess extends ProductState {
  final List<Product> products;

  const ProductLoadSuccess({@required this.products})
    : assert(products != null);

  @override
  List<Object> get props => [products];
}

//загрузка не удалась
class ProductLoadFailure extends ProductState {}

