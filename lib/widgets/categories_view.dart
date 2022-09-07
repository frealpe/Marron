
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/widgets/single_card.dart';
import 'package:flutter/material.dart';


class CategoriesView extends StatefulWidget {
const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {

  List <Categoria> categoria = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final providercategoria = Provider.of<CategoriesProvider>(context,listen: false); 
    final  categoria = providercategoria.categorias;
    print(categoria);
    setState((){categoria;});  
    //categoria=data;
  }

  @override
  Widget build(BuildContext context) {
    final categoria = Provider.of<CategoriesProvider>(context,listen: false).categorias;
    print(categoria[1].nombre);
    return Table(
       children: [
        TableRow(
          children: [
          SingleCard(imagen: 'REF485',),
          SingleCard(imagen: 'REF486'),
          ]
        ),
        TableRow(
          children: [
          SingleCard(imagen: 'REF487'),
          SingleCard(imagen: 'REF488'),
          ]
        ),
        TableRow(
          children: [
          SingleCard(imagen: 'REF489'),
          SingleCard(imagen: 'REF485'),
          ]
        ),



       ], 

    );
    
  }
}


