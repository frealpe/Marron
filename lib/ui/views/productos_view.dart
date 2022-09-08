import 'package:flutter/material.dart';



class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:[

         Text('Marrón Marroquinería',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        ]
      ),
    );
  }
}