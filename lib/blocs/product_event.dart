import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

//класс событий приложения
abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

//запрос совершён
class ProductRequested extends ProductEvent {
  @override

  List<Object> get props => [];

}