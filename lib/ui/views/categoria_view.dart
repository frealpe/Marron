import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/widgets/Background.dart';
import 'package:admin_dashboard/widgets/page_title.dart';
import 'package:flutter/material.dart';



class CategoriaView extends StatelessWidget {

  final String categoria;
  CategoriaView({
    Key? key,
    required this.categoria
    }) : super(key: key);

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