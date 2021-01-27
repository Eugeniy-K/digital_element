import 'package:digital_element/Screens/splash_screen.dart';
import 'package:digital_element/blocs/blocs.dart';
import 'package:digital_element/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  final ProductRepository productRepository = ProductRepository(
      productApiClient: ProductApiClient(
        httpClient: http.Client(),
      ));

  runApp(MyApp(productRepository: productRepository,));
}

class MyApp extends StatelessWidget {
  final ProductRepository productRepository;

  MyApp({Key key, @required this.productRepository})
    : assert(productRepository != null),
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Digital Element',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocProvider(
          create: (context) =>
              ProductBloc(productRepository: productRepository),
          child: SplashScreen(productRepository: productRepository,),
        )
    );
  }
}

