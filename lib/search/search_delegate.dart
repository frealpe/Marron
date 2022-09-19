
import 'package:admin_dashboard/providers/providers.dart';
import 'package:flutter/material.dart';


class ProductSearchDelegate extends SearchDelegate{

  @override
  // TODO: implement searchFieldDecorationTheme
  String? get searchFieldLabel => 'Buscar artículo';
  
//////////////////////////////////////////////////////////////////////////////  
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
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
//////////////////////////////////////////////////////////////////////////////
Widget _emptyContainer(){
  return Container(
        child: Center(
          child: Icon(Icons.movie_creation_outlined,color: Colors.black38,size: 130,),
          ),
      );
}

//////////////////////////////////////////////////////////////////////////////
  @override
  Widget buildSuggestions(BuildContext context) {
 
    if(query.isEmpty){
      return _emptyContainer();
    }

   return  Busqueda(query:query);
    
  }
//////////////////////////////////////////////////////////////////////////////

}

//////////////////////////////////////////////////////////////////////////////
class Busqueda extends StatelessWidget {

  final String query;

  const Busqueda({super.key, 
  required this.query
  });
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
              create: ( _ ) => ProductosProvider(),
              child: Final_retorno(query:query), 
              ) ;
  }
}
/////////////////////////////////////////////////////////////////////////////////

class Final_retorno extends StatelessWidget {

  final String query;
  const Final_retorno({    
    Key? key,
    required this.query
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productosProvider = Provider.of<ProductosProvider>(context, listen: false);
    productosProvider.busProduct(query);

    return Container();
  }
}

/* StreamBuilder(
        stream: productosProvider.productos,
        builder: ( _, AsyncSnapshot<List<Movie>> snapshot) {
          
          if( !snapshot.hasData ) return _emptyContainer();

          final movies = snapshot.data!;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: ( _, int index ) => _MovieItem( movies[index])
          );
        },
      ); */