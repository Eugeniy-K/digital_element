import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:digital_element/Screens/product_screen.dart';
import 'package:digital_element/blocs/blocs.dart';
import 'package:digital_element/main.dart';
import 'package:digital_element/repositories/repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';



//начальный экран с заставкой
class SplashScreen extends StatefulWidget {

  const SplashScreen({Key key}) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final _bgcolor = Color(0xFF1C6CD5);
  final ProductRepository productRepository = ProductRepository(
      productApiClient: ProductApiClient(
        httpClient: http.Client(),
      ));



  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => ProductBloc(productRepository: productRepository),
              child: ProductScreen(productRepository: productRepository),
            ),
        )));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: _bgcolor,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment(0.2, 0.0),
              child:
                SvgPicture.asset("assets/images/Vector.svg"),
              ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: SvgPicture.asset("assets/images/Vector (1).svg"),),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: SvgPicture.asset("assets/images/Vector (2).svg"),),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: SvgPicture.asset("assets/images/Digital.svg"),)
          ],
        ),);
  }
}
