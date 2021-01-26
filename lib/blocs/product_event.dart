import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductRequested extends ProductEvent {
  @override

  List<Object> get props => [];

}