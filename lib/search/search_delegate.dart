
import 'package:admin_dashboard/models/http/productoid_response.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:flutter/material.dart';


class ProductSearchDelegate extends SearchDelegate{

  @override
  // TODO: implement searchFieldDecorationTheme
  String? get searchFieldLabel => 'Buscar artículo';
  
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => query ='',
        )
    ]; 
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
          close(context, null);
      }, 
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

Widget _emptyContainer(){
  return Container(
        child: Center(
          child: Icon(Icons.movie_creation_outlined,color: Colors.black38,size: 130,),
          ),
      );
}

  @override
  Widget buildSuggestions(BuildContext context) {
 
    if(query.isEmpty){
      return _emptyContainer();
    }


  final productosProvider = Provider.of<ProductosProvider>(context,listen: false);

   return FutureBuilder(
    future: productosProvider.getProduCate(query),
    builder: (_,AsyncSnapshot<List<Producto>> snapshot) {
      if(!snapshot.hasData)return _emptyContainer();

      return Container();
    },
    
    );
  }


}

//getProduCate