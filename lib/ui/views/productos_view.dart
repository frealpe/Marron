import 'package:admin_dashboard/widgets/Background.dart';
import 'package:admin_dashboard/widgets/page_title.dart';
import 'package:flutter/material.dart';



class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
        children:[
        Background(),
        PageTitle(),
        ]
      ),
    );
  }
}