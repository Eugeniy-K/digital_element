import 'package:digital_element/models/models.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  Product product;

  ProductItem({@required this.product,
    Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),

      margin: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
              height: 140,
              child: Image.network(product.image,)),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                product.article,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300
                ),),),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
                product.name,
                style: TextStyle(
                    fontSize: 12),),),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text('${product.price} руб.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),))
        ],
      ),
    );
  }
}
