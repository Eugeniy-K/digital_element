import 'package:digital_element/blocs/blocs.dart';
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
    return BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadInProgress) {
            return Center(child: CircularProgressIndicator(),);
          }
          if (state is ProductLoadSuccess) {
            final products = state.products;
            return Text(products.toString());
          }
        }
    );
  }
}
