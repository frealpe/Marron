
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

//  Categoria? categoria;

  List <Categoria> categorias = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    final categoriaProvider     = Provider.of<CategoriesProvider>(context,listen: false);
    final categoriaFromProvider = Provider.of<CategoriaFormProvider>(context,listen: false);

    categoriaProvider.getCategories()
    .then((categoriasDB){
    categoriaFromProvider.categorias=categoriasDB;
    setState((){categorias=categoriasDB;});  
    print(categorias[0].nombre);
    });


  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
 duration: Duration(microseconds: 300);
 print(categorias.length);

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


