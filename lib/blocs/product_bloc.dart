import 'package:digital_element/blocs/product_event.dart';
import 'package:digital_element/blocs/product_state.dart';
import 'package:digital_element/models/models.dart';
import 'package:digital_element/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

//класс мапинга событие->состояние
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({@required this.productRepository})
    : assert(productRepository != null),
    super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is ProductRequested) {
      yield ProductLoadInProgress();
      try {
        final List<Product> products = await productRepository.getProduct();
        yield ProductLoadSuccess(products: products);
      } catch (_) {
        yield ProductLoadFailure();
      }
    }
  }
}