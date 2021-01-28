import 'package:digital_element/blocs/blocs.dart';
import 'package:digital_element/repositories/repositories.dart';
import 'package:digital_element/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  final ProductRepository productRepository;

  ProductScreen({this.productRepository});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(
            'Список товаров',
            style: TextStyle(
              color: Colors.black
            ),),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ProductBloc(productRepository: productRepository),
        child: ProductWidget(),
      ),
      // body: ProductWidget(),
    );
  }


}

// class ProductScreen extends StatefulWidget {
//   @override
//   _ProductScreenState createState() => _ProductScreenState();
// }
//
// class _ProductScreenState extends State<ProductScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

