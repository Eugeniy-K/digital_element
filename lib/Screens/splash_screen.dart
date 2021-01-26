import 'dart:async';
import 'package:digital_element/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


//начальный экран с заставкой
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MyHomePage(title: 'Flutter Demo Home Page'))));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF1C6CD5,),
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
