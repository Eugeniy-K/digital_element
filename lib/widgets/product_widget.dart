import 'package:digital_element/blocs/blocs.dart';
import 'package:digital_element/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductWidget extends StatefulWidget {
  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(ProductRequested());
  }
  @override
  Widget build(BuildContext context) {
    //Размер окна приложения
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 300) / 2;
    final double itemWidth = size.width / 2;
    return BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadInProgress) {
            return Center(child: CircularProgressIndicator(),);
          }
          if (state is ProductLoadSuccess) {
            final products = state.products;
            return GridView.count(
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisCount: 2,
                children: List.generate(products.length, (index) {
                  final product = products[index];
                  return ProductItem(product: product);
                })
            );
          }
          else return Text('Что то пошло не так');
        }
    );
  }
}
